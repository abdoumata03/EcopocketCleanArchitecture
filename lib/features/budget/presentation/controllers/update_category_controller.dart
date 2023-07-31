import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/module.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/budget_amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/budget_type_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/slider_value_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/providers/home_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_category_controller.g.dart';

@riverpod
class UpdateCategory extends _$UpdateCategory {
  @override
  void build() {
    return;
  }

  Future<void> updateCategory({required Category category}) async {
    final budgetType = ref.read(budgetTypeProvider(
        budgetType: category.budgetType == 'amount'
            ? BudgetTypes.amount
            : BudgetTypes.percentage));
    final sliderValue =
        ref.read(sliderValueProvider(value: category.budgetPercentage));
    final budgetAmount = ref.read(budgetAmountProvider);

    final Category updatedCategory;

    if (budgetType == BudgetTypes.amount) {
      updatedCategory = category.copyWith(
        budgetAmount: double.parse(budgetAmount),
        budgetType: 'amount',
        budgetPercentage: null,
      );
    } else {
      updatedCategory = category.copyWith(
        budgetAmount: double.parse(budgetAmount),
        budgetType: 'percentage',
        budgetPercentage: sliderValue,
      );
    }

    final newCategory =
        ref.read(budgetRepositoryProvider).updateBudget(updatedCategory);
    ref.invalidate(getCategoriesProvider(CategoryType.budget));
    ref.read(getCategoriesProvider(CategoryType.budget));
    ref.invalidate(getCategoriesProvider(CategoryType.noBudget));
    ref.read(getCategoriesProvider(CategoryType.noBudget));
    return newCategory;
  }
}
