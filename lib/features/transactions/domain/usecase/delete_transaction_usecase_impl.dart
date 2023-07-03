import 'package:ecopocket_clean_architecture/features/transactions/domain/repository/transactions_repository.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/usecase/delete_transaction_usecase.dart';

class DeleteTransactionUseCaseImpl implements DeleteTransactionUseCase {
  final TransactionsRepository _repository;

  DeleteTransactionUseCaseImpl(this._repository);

  @override
  Future<void> execute(int id) {
    return _repository.deleteTransaction(id);
  }
}
