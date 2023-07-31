import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_amount_controller.g.dart';

@Riverpod(keepAlive: true)
class BudgetAmount extends _$BudgetAmount {
  @override
  String build() {
    return '';
  }

  void onChange(value) {
    state = value;
  }
}
