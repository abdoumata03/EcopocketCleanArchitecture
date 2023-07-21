// ignore_for_file: depend_on_referenced_packages

import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/module.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/date_filter_controller.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_controller.g.dart';

@riverpod
class TransactionsController extends _$TransactionsController {
  late TransactionList originalList;
  bool isSorted = false;

  Future<TransactionList> _fetchTransactions() async {
    final transactionList =
        await ref.watch(transactionsRepositoryProvider).getTransactionList();
    originalList = transactionList;
    return transactionList;
  }

  @override
  Future<TransactionList> build() {
    return _fetchTransactions();
  }

  Future<TransactionList> _fetchTransactionsByDateRange() async {
    final dateRange = ref.watch(dateFilterControllerProvider);
    final dateRangeObject = DateRange(dateRange!.start, dateRange.end);
    final transactionList = await ref
        .watch(transactionsRepositoryProvider)
        .getTransactionListByDateRange(dateRangeObject);
    return transactionList;
  }

  void applyDateRangeFilter() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchTransactionsByDateRange());
  }

  void sortByAmount() async {
    var transactionList = state.value!;
    originalList = transactionList;
    var sorted = transactionList.sortByAmount();
    isSorted = true;
    state = AsyncValue.data(sorted);
  }

  void unsort() async {
    state = AsyncValue.data(originalList);
    isSorted = false;
  }
}
