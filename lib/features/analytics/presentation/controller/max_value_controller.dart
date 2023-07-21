// ignore_for_file: body_might_complete_normally_nullable

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'max_value_controller.g.dart';

@riverpod
class MaxValueController extends _$MaxValueController {
  @override
  double? build() {}

  void setMax(double max) {
    state = max;
  }
}
