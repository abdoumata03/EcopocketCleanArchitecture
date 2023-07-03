import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import "package:freezed_annotation/freezed_annotation.dart";

part 'transaction_list.freezed.dart';

@freezed
class TransactionList with _$TransactionList {
  const factory TransactionList({required List<Transaction> transactions}) =
      _TransactionList;

  int get length => transactions.length;

  TransactionList addTransaction(final Transaction newTransaction) =>
      copyWith(transactions: [...transactions, newTransaction]);

  TransactionList updateTransaction(final Transaction newTransaction) {
    return copyWith(
        transactions: transactions
            .map((transaction) => newTransaction.id == transaction.id
                ? newTransaction
                : transaction)
            .toList());
  }

  TransactionList removeTransactionById(final Transaction transaction) =>
      copyWith(
          transactions:
              transactions.where((t) => t.id != transaction.id).toList());

  const TransactionList._();
}
