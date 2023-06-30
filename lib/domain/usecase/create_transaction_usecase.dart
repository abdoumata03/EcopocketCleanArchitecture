import 'package:ecopocket_clean_architecture/domain/model/transaction.dart';

abstract class CreateTransactionUseCase {
  Future<Transaction> execute(double amount, String type, int? category,
      String wallet, String description, DateTime createdTime);
}
