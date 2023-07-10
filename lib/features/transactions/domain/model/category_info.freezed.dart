// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryInfo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double? get budget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryInfoCopyWith<CategoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInfoCopyWith<$Res> {
  factory $CategoryInfoCopyWith(
          CategoryInfo value, $Res Function(CategoryInfo) then) =
      _$CategoryInfoCopyWithImpl<$Res, CategoryInfo>;
  @useResult
  $Res call(
      {int id,
      String name,
      int count,
      String color,
      String icon,
      double total,
      double? budget});
}

/// @nodoc
class _$CategoryInfoCopyWithImpl<$Res, $Val extends CategoryInfo>
    implements $CategoryInfoCopyWith<$Res> {
  _$CategoryInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
    Object? color = null,
    Object? icon = null,
    Object? total = null,
    Object? budget = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryInfoCopyWith<$Res>
    implements $CategoryInfoCopyWith<$Res> {
  factory _$$_CategoryInfoCopyWith(
          _$_CategoryInfo value, $Res Function(_$_CategoryInfo) then) =
      __$$_CategoryInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int count,
      String color,
      String icon,
      double total,
      double? budget});
}

/// @nodoc
class __$$_CategoryInfoCopyWithImpl<$Res>
    extends _$CategoryInfoCopyWithImpl<$Res, _$_CategoryInfo>
    implements _$$_CategoryInfoCopyWith<$Res> {
  __$$_CategoryInfoCopyWithImpl(
      _$_CategoryInfo _value, $Res Function(_$_CategoryInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
    Object? color = null,
    Object? icon = null,
    Object? total = null,
    Object? budget = freezed,
  }) {
    return _then(_$_CategoryInfo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_CategoryInfo extends _CategoryInfo {
  const _$_CategoryInfo(
      {required this.id,
      required this.name,
      required this.count,
      required this.color,
      required this.icon,
      required this.total,
      required this.budget})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final int count;
  @override
  final String color;
  @override
  final String icon;
  @override
  final double total;
  @override
  final double? budget;

  @override
  String toString() {
    return 'CategoryInfo(id: $id, name: $name, count: $count, color: $color, icon: $icon, total: $total, budget: $budget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.budget, budget) || other.budget == budget));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, count, color, icon, total, budget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryInfoCopyWith<_$_CategoryInfo> get copyWith =>
      __$$_CategoryInfoCopyWithImpl<_$_CategoryInfo>(this, _$identity);
}

abstract class _CategoryInfo extends CategoryInfo {
  const factory _CategoryInfo(
      {required final int id,
      required final String name,
      required final int count,
      required final String color,
      required final String icon,
      required final double total,
      required final double? budget}) = _$_CategoryInfo;
  const _CategoryInfo._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  int get count;
  @override
  String get color;
  @override
  String get icon;
  @override
  double get total;
  @override
  double? get budget;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryInfoCopyWith<_$_CategoryInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
