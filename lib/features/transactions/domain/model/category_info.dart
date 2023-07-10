import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_info.freezed.dart';

@freezed
class CategoryInfo with _$CategoryInfo {
  const factory CategoryInfo({
    required int id,
    required String name,
    required int count,
    required String color,
    required String icon,
    required double total,
    required double? budget,
  }) = _CategoryInfo;

  const CategoryInfo._();
}
