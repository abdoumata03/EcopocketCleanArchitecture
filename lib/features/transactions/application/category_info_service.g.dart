// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_info_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todaysTotalHash() => r'5c5aeb10d8c7190782b7ca84d1e473a918ca2ae7';

/// See also [todaysTotal].
@ProviderFor(todaysTotal)
final todaysTotalProvider = AutoDisposeFutureProvider<double>.internal(
  todaysTotal,
  name: r'todaysTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todaysTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodaysTotalRef = AutoDisposeFutureProviderRef<double>;
String _$yesterdaysTotalHash() => r'0cb49565c99c2b4f9370dcbf207a355545a3dbe9';

/// See also [yesterdaysTotal].
@ProviderFor(yesterdaysTotal)
final yesterdaysTotalProvider = AutoDisposeFutureProvider<double>.internal(
  yesterdaysTotal,
  name: r'yesterdaysTotalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$yesterdaysTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef YesterdaysTotalRef = AutoDisposeFutureProviderRef<double>;
String _$getTodaysCategoriesInfoListHash() =>
    r'8c05dad3f187d9bffe1bf755601e7d64a9cd5d90';

/// See also [getTodaysCategoriesInfoList].
@ProviderFor(getTodaysCategoriesInfoList)
final getTodaysCategoriesInfoListProvider =
    AutoDisposeFutureProvider<CategoryInfoList>.internal(
  getTodaysCategoriesInfoList,
  name: r'getTodaysCategoriesInfoListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTodaysCategoriesInfoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTodaysCategoriesInfoListRef
    = AutoDisposeFutureProviderRef<CategoryInfoList>;
String _$getYesterdaysCategoriesInfoListHash() =>
    r'da720f79e29ed85b0354a78f4ad42d42912a7bd6';

/// See also [getYesterdaysCategoriesInfoList].
@ProviderFor(getYesterdaysCategoriesInfoList)
final getYesterdaysCategoriesInfoListProvider =
    AutoDisposeFutureProvider<CategoryInfoList>.internal(
  getYesterdaysCategoriesInfoList,
  name: r'getYesterdaysCategoriesInfoListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getYesterdaysCategoriesInfoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetYesterdaysCategoriesInfoListRef
    = AutoDisposeFutureProviderRef<CategoryInfoList>;
String _$getSpendingsHash() => r'e1e9d91a215ba653ddce5a0b418f8d404fc10318';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetSpendingsRef = AutoDisposeFutureProviderRef<double>;

/// See also [getSpendings].
@ProviderFor(getSpendings)
const getSpendingsProvider = GetSpendingsFamily();

/// See also [getSpendings].
class GetSpendingsFamily extends Family<AsyncValue<double>> {
  /// See also [getSpendings].
  const GetSpendingsFamily();

  /// See also [getSpendings].
  GetSpendingsProvider call({
    required DateRange range,
  }) {
    return GetSpendingsProvider(
      range: range,
    );
  }

  @override
  GetSpendingsProvider getProviderOverride(
    covariant GetSpendingsProvider provider,
  ) {
    return call(
      range: provider.range,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getSpendingsProvider';
}

/// See also [getSpendings].
class GetSpendingsProvider extends AutoDisposeFutureProvider<double> {
  /// See also [getSpendings].
  GetSpendingsProvider({
    required this.range,
  }) : super.internal(
          (ref) => getSpendings(
            ref,
            range: range,
          ),
          from: getSpendingsProvider,
          name: r'getSpendingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSpendingsHash,
          dependencies: GetSpendingsFamily._dependencies,
          allTransitiveDependencies:
              GetSpendingsFamily._allTransitiveDependencies,
        );

  final DateRange range;

  @override
  bool operator ==(Object other) {
    return other is GetSpendingsProvider && other.range == range;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, range.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions