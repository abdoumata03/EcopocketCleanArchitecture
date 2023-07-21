import 'package:ecopocket_clean_architecture/features/transactions/data/module.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/repository/transaction_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'repository/transactions_repository.dart';

part 'module.g.dart';

@Riverpod(keepAlive: true)
TransactionsRepository transactionsRepository(TransactionsRepositoryRef ref) {
  return TransactionsRepositoryImpl(ref.watch(transactionsDatabaseProvider));
}
