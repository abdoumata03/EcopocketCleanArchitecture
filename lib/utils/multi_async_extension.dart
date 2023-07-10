import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef MultiAsync<T> = Iterable<AsyncValue<T>>;

extension MultiAsyncExtension<T> on MultiAsync<T> {
  /// Performs an action based on the state of the [AsyncValue].
  ///
  /// All cases are required, which allows returning a non-nullable value.
  R when<R>({
    required R Function(Iterable<T> data) data,
    required R Function(
      Iterable<Object> error,
      Iterable<StackTrace?> stackTrace,
    ) error,
    required R Function() loading,
  }) {
    if (any((element) => element is AsyncError)) {
      final err = where(
        (element) => element is AsyncError,
      ).map((e) => e as AsyncError);

      return error(
        err.map((e) => e.error),
        err.map((e) => e.stackTrace),
      );
    } else if (any((element) => element is AsyncLoading)) {
      return loading();
    } else if (every((element) => element is AsyncData)) {
      return data(map((e) => e.value as T));
    } else {
      return error([], []);
    }
  }
}
