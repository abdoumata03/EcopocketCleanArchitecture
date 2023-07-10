import 'package:ecopocket_clean_architecture/features/budget/data/entity/category_entity.dart';
import 'package:ecopocket_clean_architecture/features/budget/data/mapper/category_mapper.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category_list.dart';

class CategoryListMapper {
  static CategoryList toModel(final CategoryListEntity entityList) {
    final values =
        entityList.map((entity) => CategoryMapper.toModel(entity)).toList();
    return CategoryList(categories: values);
  }

  static CategoryListEntity toMap(final CategoryList categoryList) {
    return categoryList.categories
        .map((category) => CategoryMapper.toMap(category))
        .toList();
  }
}
