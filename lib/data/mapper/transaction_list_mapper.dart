import 'package:ecopocket_clean_architecture/data/entity/transactions_entity.dart';
import 'package:ecopocket_clean_architecture/data/mapper/transaction_mapper.dart';
import 'package:ecopocket_clean_architecture/domain/model/transaction_list.dart';

class TransactionListMapper {
  static TransactionList toModel(final TransactionListEntity entities) {
    final values =
        entities.map((entity) => TransactionMapper.toModel(entity)).toList();
    return TransactionList(transactions: values);
  }

  static TransactionListEntity toMap(final TransactionList model) =>
      model.transactions
          .map((transaction) => TransactionMapper.toMap(transaction))
          .toList();
}
