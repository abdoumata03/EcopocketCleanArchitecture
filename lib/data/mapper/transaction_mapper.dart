import 'package:ecopocket_clean_architecture/data/entity/transactions_entity.dart';
import 'package:ecopocket_clean_architecture/domain/model/transaction.dart';

class TransactionMapper {
  static Transaction toModel(final TransactionEntity entity) {
    return Transaction(
        id: entity['id'],
        amount: entity['amount'],
        type: entity['type'],
        category: entity['category'],
        wallet: entity['wallet'],
        description: entity['description'],
        createdTime: entity['createdTime']);
  }

  static TransactionEntity toMap(final Transaction model) {
    return {
      'id': model.id,
      'amount': model.amount,
      'type': model.type,
      'category': model.category,
      'wallet': model.wallet,
      'description': model.description,
      'createdTime': model.createdTime,
    };
  }
}
