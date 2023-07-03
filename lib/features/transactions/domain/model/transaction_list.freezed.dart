// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionList {
  List<Transaction> get transactions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionListCopyWith<TransactionList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListCopyWith<$Res> {
  factory $TransactionListCopyWith(
          TransactionList value, $Res Function(TransactionList) then) =
      _$TransactionListCopyWithImpl<$Res, TransactionList>;
  @useResult
  $Res call({List<Transaction> transactions});
}

/// @nodoc
class _$TransactionListCopyWithImpl<$Res, $Val extends TransactionList>
    implements $TransactionListCopyWith<$Res> {
  _$TransactionListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionListCopyWith<$Res>
    implements $TransactionListCopyWith<$Res> {
  factory _$$_TransactionListCopyWith(
          _$_TransactionList value, $Res Function(_$_TransactionList) then) =
      __$$_TransactionListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Transaction> transactions});
}

/// @nodoc
class __$$_TransactionListCopyWithImpl<$Res>
    extends _$TransactionListCopyWithImpl<$Res, _$_TransactionList>
    implements _$$_TransactionListCopyWith<$Res> {
  __$$_TransactionListCopyWithImpl(
      _$_TransactionList _value, $Res Function(_$_TransactionList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$_TransactionList(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$_TransactionList extends _TransactionList {
  const _$_TransactionList({required final List<Transaction> transactions})
      : _transactions = transactions,
        super._();

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionList(transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionList &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionListCopyWith<_$_TransactionList> get copyWith =>
      __$$_TransactionListCopyWithImpl<_$_TransactionList>(this, _$identity);
}

abstract class _TransactionList extends TransactionList {
  const factory _TransactionList(
      {required final List<Transaction> transactions}) = _$_TransactionList;
  const _TransactionList._() : super._();

  @override
  List<Transaction> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionListCopyWith<_$_TransactionList> get copyWith =>
      throw _privateConstructorUsedError;
}
