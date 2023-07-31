import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_list.freezed.dart';

@freezed
class CategoryList with _$CategoryList {
  const factory CategoryList({required List<Category> categories}) =
      _CategoryList;

  int get length => categories.length;

  operator [](int index) => categories[index];

  CategoryList get haveBudgetCategories {
    return copyWith(
        categories: categories
            .where((category) => category.budgetAmount != null)
            .toList());
  }

  CategoryList get noBudgetCategories {
    return copyWith(
        categories: categories
            .where((category) => category.budgetAmount == null)
            .toList());
  }

  const CategoryList._();
}
