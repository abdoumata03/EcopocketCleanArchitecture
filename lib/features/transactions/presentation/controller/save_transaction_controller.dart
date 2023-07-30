import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/analytics_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/bar_chart_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/spending_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/module.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_transaction_controller.g.dart';

@riverpod
class NewTransaction extends _$NewTransaction {
  @override
  void build() {
    return;
  }

  Future<Transaction> saveTranscation(
      {amount, type, category, wallet, description, createdTime}) async {
    final newTransaction =
        ref.read(transactionsRepositoryProvider).createTransaction(
              amount,
              type,
              category,
              wallet,
              description,
              createdTime,
            );

    ref.invalidate(getTodaysCategoriesInfoListProvider);
    ref.read(getTodaysCategoriesInfoListProvider);
    ref.invalidate(todaysTotalProvider);
    ref.read(todaysTotalProvider);
    const period = TimePeriod.thisMonth;
    final range = ref.watch(getDateRangeProvider(period));
    ref.invalidate(getSpendingsProvider(range: range));
    ref.read(getSpendingsProvider(range: range));
    ref.read(analyticsControllerProvider.notifier).toggle(period);
    ref.read(barChartDataMapControllerProvider.notifier).setState();
    ref.read(spendingControllerProvider.notifier).updateSpending();

    return newTransaction;
  }
}
