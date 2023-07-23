import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bar_chart_touched_index_controller.g.dart';

@riverpod
class BarChartTouchedIndexController extends _$BarChartTouchedIndexController {
  @override
  int build() {
    return -1;
  }

  void setIndex(int index) {
    state = index;
  }
}
