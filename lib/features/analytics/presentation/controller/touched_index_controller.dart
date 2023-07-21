import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'touched_index_controller.g.dart';

@riverpod
class TouchedIndexController extends _$TouchedIndexController {
  @override
  int build() {
    return -1;
  }

  void setIndex(int index) {
    state = index;
  }
}
