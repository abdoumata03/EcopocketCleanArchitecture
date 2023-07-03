import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/repository/transactions_repository.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/usecase/get_transaction_list_usecase.dart';

class GetTransactionListUseCaseImpl implements GetTransactionListUseCase {
  final TransactionsRepository _repository;

  GetTransactionListUseCaseImpl(this._repository);
  @override
  Future<TransactionList> execute() => _repository.getTransactionList();
}
