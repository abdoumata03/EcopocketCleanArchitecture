import 'package:ecopocket_clean_architecture/features/transactions/data/entity/transactions_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';

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

  static TransactionEntity toNewEntityMap(
    final double amount,
    final String type,
    final int? category,
    final String? wallet,
    final String description,
    final DateTime createdTime,
  ) {
    return {
      'id': null,
      'amount': amount,
      'type': type,
      'category': category,
      'wallet': wallet,
      'description': description,
      'createdTime': createdTime.toIso8601String(),
    };
  }
}
