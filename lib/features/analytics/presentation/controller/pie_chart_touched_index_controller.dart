import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pie_chart_touched_index_controller.g.dart';

@riverpod
class PieChartTouchedIndexController extends _$PieChartTouchedIndexController {
  @override
  int build() {
    return -1;
  }

  void setIndex(int index) {
    state = index;
  }
}
