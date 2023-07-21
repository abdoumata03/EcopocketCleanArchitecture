import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/module.dart';
import 'package:ecopocket_clean_architecture/utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_provider.dart';
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
    final period = ref.watch(getDateRangeProvider(TimePeriod.thisWeek));
    ref.invalidate(getSpendingsProvider(range: period));
    ref.read(getSpendingsProvider(range: period));

    return newTransaction;
  }
}
