import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/period_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/module.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spending_controller.g.dart';

@riverpod
class SpendingController extends _$SpendingController {
  Future<double> getSpending() async {
    final period = ref.read(periodControllerProvider);
    final range = ref.watch(getDateRangeProvider(period));
    final repo = ref.watch(transactionsRepositoryProvider);
    return repo.getSpendings(range);
  }

  @override
  Future<double> build() {
    return getSpending();
  }

  void updateSpending() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => getSpending());
  }
}
