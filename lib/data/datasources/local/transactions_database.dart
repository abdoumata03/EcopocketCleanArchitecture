import 'package:ecopocket_clean_architecture/data/entity/transactions_entity.dart';

abstract class TransactionsDatabase {
  Future<TransactionListEntity> allTransactions();
  Future<TransactionEntity> addTransaction(
      final TransactionEntity transactionEntity);
  Future<void> updateTransaction(final TransactionEntity transactionEntity);
  Future<void> deleteTransaction(final int id);
}
