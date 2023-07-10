import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_info_list.freezed.dart';

@freezed
class CategoryInfoList with _$CategoryInfoList {
  const factory CategoryInfoList({
    required List<CategoryInfo> categoryInfoList,
  }) = _CategoryInfoList;

  int get length => categoryInfoList.length;

  operator [](final int index) => categoryInfoList[index];

  const CategoryInfoList._();
}
