import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/budget_amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/category_budget_dialog.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'slider_value_controller.g.dart';

@riverpod
class SliderValue extends _$SliderValue {
  @override
  double build({required double? value}) {
    if (value != null) {
      return value;
    }
    return 0.0;
  }

  void change(double value) {
    final monthlyBudget =
        ref.watch(appSharedPreferenceProvider).getMonthlyBudget();
    final double amount = monthlyBudget * value;
    final String formattedAmount = amount.toStringAsFixed(0);
    ref.read(budgetAmountProvider.notifier).onChange(formattedAmount);
    categoryBudgetTextController.text = formattedAmount;
    state = value;
  }
}
