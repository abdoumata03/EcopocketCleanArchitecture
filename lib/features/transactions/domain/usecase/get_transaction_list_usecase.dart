import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction_list.dart';

abstract class GetTransactionListUseCase {
  Future<TransactionList> execute();
}
