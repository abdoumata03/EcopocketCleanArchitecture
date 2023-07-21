import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'amount_controller.g.dart';

@riverpod
class Amount extends _$Amount {
  @override
  String build() {
    return '0';
  }

  void onKeyTap(val) {
    if (val == "0" && state == "0") {
      return;
    }
    if (val == "." && state.contains(".")) {
      return;
    }
    if (val != "0" && val != "." && state == "0") {
      state = val;
      return;
    }
    state = state + val;
  }

  void onBackspacePress() {
    if (state == "0") {
      return;
    }

    if (state.length == 1) {
      state = "0";
      return;
    }
    state = state.substring(0, state.length - 1);
  }

  void onLongPress() {
    if (state.isEmpty) {
      return;
    }
    state = '0';
  }
}
