import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_type_controller.g.dart';

@riverpod
class BudgetType extends _$BudgetType {
  @override
  BudgetTypes build({required BudgetTypes budgetType}) {
    return budgetType;
  }

  void toggle(bool value) {
    final type = value ? BudgetTypes.percentage : BudgetTypes.amount;
    state = type;
  }
}

enum BudgetTypes {
  amount,
  percentage,
}
