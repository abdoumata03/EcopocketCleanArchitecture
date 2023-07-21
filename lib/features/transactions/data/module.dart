import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/transactions_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/transactions_database_impl.dart';

part 'module.g.dart';

@Riverpod(keepAlive: true)
TransactionsDatabase transactionsDatabase(TransactionsDatabaseRef ref) {
  return TransactionsDatabaseImplemention();
}