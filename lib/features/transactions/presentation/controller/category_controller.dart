import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.g.dart';

@riverpod
class ChosenCategory extends _$ChosenCategory {
  @override
  Category? build() {
    return null;
  }

  void setCategory(category) {
    state = category;
  }
}
