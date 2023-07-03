import "package:freezed_annotation/freezed_annotation.dart";

part 'transaction.freezed.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required double amount,
    required String type,
    required int? category,
    required String wallet,
    required String description,
    required DateTime createdTime,
  }) = _Transaction;

  const Transaction._();
}
