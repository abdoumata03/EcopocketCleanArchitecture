import 'package:ecopocket_clean_architecture/exceptions/amount_exceeded.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/analytics_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/bar_chart_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/spending_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/module.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/category_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/providers/home_providers.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/module.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_transaction_controller.g.dart';

@riverpod
class NewTransaction extends _$NewTransaction {
  @override
  void build() {
    return;
  }

  void saveTranscation(
      {amount, type, category, wallet, description, createdTime}) async {
    ref.read(transactionsRepositoryProvider).createTransaction(
          amount,
          type,
          category,
          wallet,
          description,
          createdTime,
        );

    updateAppState(category);

    return;
  }

  Future<void> verifyBudget() async {
    // Transaction category object
    final transactionCategory = ref.read(chosenCategoryProvider);
    final categoryBudget = transactionCategory!.budgetAmount;
    final transactionAmount = double.parse(ref.watch(amountProvider));
    // DateRange utility
    final monthlyDateRange =
        ref.read(getDateRangeProvider(TimePeriod.thisMonth));
    // Monthly spending in the transaction category
    final categoryMonthlySpendingProvider = ref.read(categorySpendingProvider(
            dateRange: monthlyDateRange, categoryId: transactionCategory.id)
        .future);
    final categoryMonthlySpending = await categoryMonthlySpendingProvider;
    // Total monthly spending & budget
    final monthlySpendingProvider =
        ref.read(getSpendingsProvider(range: monthlyDateRange).future);
    final monthlySpending = await monthlySpendingProvider;
    final monthlyBudget =
        ref.read(appSharedPreferenceProvider).getMonthlyBudget();

    if (categoryBudget == null && monthlyBudget != null) {
      if (monthlySpending + transactionAmount > monthlyBudget) {
        throw MonthlyBudgetExpection();
      }
    } else if (categoryBudget != null) {
      if (categoryMonthlySpending + transactionAmount > categoryBudget) {
        throw CategoryBudgetException();
      }
    }
  }

  void updateAppState(int categoryId) {
    ref.invalidate(getTodaysCategoriesInfoListProvider);
    ref.invalidate(todaysTotalProvider);
    const period = TimePeriod.thisMonth;
    final monthRange = ref.watch(getDateRangeProvider(TimePeriod.thisMonth));
    final weekRange = ref.watch(getDateRangeProvider(TimePeriod.thisWeek));
    ref.invalidate(getSpendingsProvider(range: monthRange));
    ref.invalidate(getSpendingsProvider(range: weekRange));
    ref.read(analyticsControllerProvider.notifier).toggle(period);
    ref.read(barChartDataMapControllerProvider.notifier).setState();
    ref.read(spendingControllerProvider.notifier).updateSpending();
    ref.invalidate(categorySpendingProvider(
        dateRange: monthRange, categoryId: categoryId));
  }
}
