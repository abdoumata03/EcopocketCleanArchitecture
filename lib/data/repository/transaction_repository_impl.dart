import 'package:ecopocket_clean_architecture/data/datasources/local/transactions_database.dart';
import 'package:ecopocket_clean_architecture/data/mapper/transaction_list_mapper.dart';
import 'package:ecopocket_clean_architecture/data/mapper/transaction_mapper.dart';
import 'package:ecopocket_clean_architecture/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/domain/repository/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsDatabase database;

  const TransactionsRepositoryImpl(this.database);

  @override
  Future<Transaction> createTransaction(
      double amount,
      String type,
      int? category,
      String wallet,
      String description,
      DateTime createdTime) async {
    final transactionEntity = await database.addTransaction(
        TransactionMapper.toNewEntityMap(
            amount, type, category, wallet, description, createdTime));
    return TransactionMapper.toModel(transactionEntity);
  }

  @override
  Future<TransactionList> getTransactionList() async {
    final transactionListEntity = await database.allTransactions();
    return TransactionListMapper.toModel(transactionListEntity);
  }

  @override
  Future<void> updateTransaction(
      int id,
      double amount,
      String type,
      int? category,
      String wallet,
      String description,
      DateTime createdTime) async {
    final transaction = Transaction(
        id: id,
        amount: amount,
        type: type,
        category: category,
        wallet: wallet,
        description: description,
        createdTime: createdTime);
    await database.updateTransaction(TransactionMapper.toMap(transaction));
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await database.deleteTransaction(id);
  }
}
