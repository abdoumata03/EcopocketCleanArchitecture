import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    required String color,
    required String icon,
    required String? budgetType,
    required double? budgetAmount,
    required double? budgetPercentage,
  }) = _Category;

  const Category._();
}
