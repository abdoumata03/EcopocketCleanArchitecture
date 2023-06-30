import 'package:ecopocket_clean_architecture/domain/model/transaction_list.dart';

abstract class GetTransactionListUseCase {
  Future<TransactionList> execute();
}
