import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';

abstract class TransactionsRepository {
  Future<TransactionList> getTransactionList();
  Future<Transaction> createTransaction(
    final double amount,
    final String type,
    final int? category,
    final String wallet,
    final String description,
    final DateTime createdTime,
  );
  Future<void> updateTransaction(
    final int id,
    final double amount,
    final String type,
    final int? category,
    final String wallet,
    final String description,
    final DateTime createdTime,
  );
  Future<void> deleteTransaction(final int id);
}
