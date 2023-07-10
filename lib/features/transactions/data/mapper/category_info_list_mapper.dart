import 'package:ecopocket_clean_architecture/features/transactions/data/entity/category_info_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/mapper/category_info_mapper.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';

class CategoryInfoListMapper {
  static CategoryInfoList toModel(final CategoryInfoListEntity entities) {
    final values =
        entities.map((entity) => CategoryInfoMapper.toModel(entity)).toList();
    return CategoryInfoList(categoryInfoList: values);
  }

  static CategoryInfoListEntity toMap(final CategoryInfoList model) =>
      model.categoryInfoList
          .map((category) => CategoryInfoMapper.toMap(category))
          .toList();
}
