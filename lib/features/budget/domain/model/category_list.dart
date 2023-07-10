import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_list.freezed.dart';

@freezed
class CategoryList with _$CategoryList {
  const factory CategoryList({required List<Category> categories}) =
      _CategoryList;

  int get length => categories.length;

  const CategoryList._();
}
