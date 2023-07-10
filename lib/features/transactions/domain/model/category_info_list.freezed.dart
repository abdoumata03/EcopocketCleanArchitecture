// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_info_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryInfoList {
  List<CategoryInfo> get categoryInfoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryInfoListCopyWith<CategoryInfoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInfoListCopyWith<$Res> {
  factory $CategoryInfoListCopyWith(
          CategoryInfoList value, $Res Function(CategoryInfoList) then) =
      _$CategoryInfoListCopyWithImpl<$Res, CategoryInfoList>;
  @useResult
  $Res call({List<CategoryInfo> categoryInfoList});
}

/// @nodoc
class _$CategoryInfoListCopyWithImpl<$Res, $Val extends CategoryInfoList>
    implements $CategoryInfoListCopyWith<$Res> {
  _$CategoryInfoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryInfoList = null,
  }) {
    return _then(_value.copyWith(
      categoryInfoList: null == categoryInfoList
          ? _value.categoryInfoList
          : categoryInfoList // ignore: cast_nullable_to_non_nullable
              as List<CategoryInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryInfoListCopyWith<$Res>
    implements $CategoryInfoListCopyWith<$Res> {
  factory _$$_CategoryInfoListCopyWith(
          _$_CategoryInfoList value, $Res Function(_$_CategoryInfoList) then) =
      __$$_CategoryInfoListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryInfo> categoryInfoList});
}

/// @nodoc
class __$$_CategoryInfoListCopyWithImpl<$Res>
    extends _$CategoryInfoListCopyWithImpl<$Res, _$_CategoryInfoList>
    implements _$$_CategoryInfoListCopyWith<$Res> {
  __$$_CategoryInfoListCopyWithImpl(
      _$_CategoryInfoList _value, $Res Function(_$_CategoryInfoList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryInfoList = null,
  }) {
    return _then(_$_CategoryInfoList(
      categoryInfoList: null == categoryInfoList
          ? _value._categoryInfoList
          : categoryInfoList // ignore: cast_nullable_to_non_nullable
              as List<CategoryInfo>,
    ));
  }
}

/// @nodoc

class _$_CategoryInfoList extends _CategoryInfoList {
  const _$_CategoryInfoList(
      {required final List<CategoryInfo> categoryInfoList})
      : _categoryInfoList = categoryInfoList,
        super._();

  final List<CategoryInfo> _categoryInfoList;
  @override
  List<CategoryInfo> get categoryInfoList {
    if (_categoryInfoList is EqualUnmodifiableListView)
      return _categoryInfoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryInfoList);
  }

  @override
  String toString() {
    return 'CategoryInfoList(categoryInfoList: $categoryInfoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryInfoList &&
            const DeepCollectionEquality()
                .equals(other._categoryInfoList, _categoryInfoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoryInfoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryInfoListCopyWith<_$_CategoryInfoList> get copyWith =>
      __$$_CategoryInfoListCopyWithImpl<_$_CategoryInfoList>(this, _$identity);
}

abstract class _CategoryInfoList extends CategoryInfoList {
  const factory _CategoryInfoList(
          {required final List<CategoryInfo> categoryInfoList}) =
      _$_CategoryInfoList;
  const _CategoryInfoList._() : super._();

  @override
  List<CategoryInfo> get categoryInfoList;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryInfoListCopyWith<_$_CategoryInfoList> get copyWith =>
      throw _privateConstructorUsedError;
}
