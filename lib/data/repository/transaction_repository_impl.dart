import 'package:ecopocket_clean_architecture/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/domain/repository/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  @override
  Future<Transaction> createTransaction(
      int id,
      double amount,
      String type,
      String? category,
      String wallet,
      String description,
      DateTime createdTime) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<TransactionList> getTransactionList() {
    // TODO: implement getTransactionList
    throw UnimplementedError();
  }

  @override
  Future<void> updateTransaction(
      int id,
      double amount,
      String type,
      String? category,
      String wallet,
      String description,
      DateTime createdTime) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
