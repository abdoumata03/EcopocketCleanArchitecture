import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/repository/transactions_repository.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/usecase/create_transaction_usecase.dart';

class CreateTransactionUseCaseImpl implements CreateTransactionUseCase {
  final TransactionsRepository _repository;

  const CreateTransactionUseCaseImpl(this._repository);

  @override
  Future<Transaction> execute(double amount, String type, int? category,
      String wallet, String description, DateTime createdTime) {
    return _repository.createTransaction(
        amount, type, category, wallet, description, createdTime);
  }
}
