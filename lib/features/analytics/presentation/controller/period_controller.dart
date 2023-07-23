import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'period_controller.g.dart';

@Riverpod(keepAlive: true)
class PeriodController extends _$PeriodController {
  @override
  TimePeriod build() {
    return TimePeriod.thisWeek;
  }

  void toggle(TimePeriod period) {
    state = period;
  }
}
