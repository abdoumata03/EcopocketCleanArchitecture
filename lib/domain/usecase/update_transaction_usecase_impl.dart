import 'package:ecopocket_clean_architecture/domain/repository/transactions_repository.dart';
import 'package:ecopocket_clean_architecture/domain/usecase/update_transaction_usecase.dart';

class UpdateTransactionUseCaseImpl implements UpdateTransactionUseCase {
  final TransactionsRepository _repository;
  UpdateTransactionUseCaseImpl(this._repository);
  @override
  Future<void> execute(int id, double amount, String type, int? category,
      String wallet, String description, DateTime createdTime) {
    return _repository.updateTransaction(
        id, amount, type, category, wallet, description, createdTime);
  }
}
