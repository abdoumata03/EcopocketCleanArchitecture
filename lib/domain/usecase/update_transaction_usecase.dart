abstract class UpdateTransactionUseCase {
  Future<void> execute(int id, double amount, String type, int? category,
      String wallet, String description, DateTime createdTime);
}
