import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_filter_controller.g.dart';

@riverpod
class DateFilterController extends _$DateFilterController {
  @override
  DateTimeRange? build() {
    return null;
  }

  void setDateRange(dataRange) {
    state = dataRange;
  }
}
