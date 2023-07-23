import 'package:ecopocket_clean_architecture/features/analytics/data/entity/barchartdata_entity.dart';
import 'package:ecopocket_clean_architecture/features/analytics/domain/module.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/max_value_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/period_controller.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bar_chart_controller.g.dart';

@riverpod
class BarChartDataMapController extends _$BarChartDataMapController {
  Future<Map<int, double>> generateBarChartDataFromMap() async {
    final period = ref.watch(periodControllerProvider);
    final range = ref.watch(getDateRangeProvider(period));
    late final BarChartDataMapList dataList;
    Map<int, double> dataMap = {};

    if (period == TimePeriod.thisWeek) {
      dataList = await ref
          .watch(analyticsRepositoryProvider)
          .getWeeklyBarChartDataMap(range);
      for (int i = 0; i < 7; i++) {
        dataMap[i] = 0;
      }
    } else if (period == TimePeriod.thisMonth) {
      dataList = await ref
          .watch(analyticsRepositoryProvider)
          .getMonthlyBarChartDataMap(range);
      for (int i = 0; i <= 30; i++) {
        dataMap[i] = 0;
      }
    }

    double highestValue = 0;
    // Fill in the map with the actual data from the dataList
    for (var data in dataList) {
      int day = int.parse(data['day']);
      double totalSpent = data['total_spent'].toDouble();
      dataMap[day] = totalSpent;
      if (totalSpent > highestValue) {
        highestValue = totalSpent;
      }
    }

    final double maxValue = calculateMaxValue(highestValue);

    ref.read(maxValueControllerProvider.notifier).setMax(maxValue.toDouble());

    return dataMap;
  }

  @override
  Future<Map<int, double>> build() async {
    final things = await generateBarChartDataFromMap();
    return things;
  }

  double calculateMaxValue(double highestValue) {
    List<double> maxValues = [
      1000,
      2000,
      5000,
      10000,
      20000,
      50000,
      100000,
      200000,
      500000,
      1000000,
      2000000,
      5000000,
      10000000,
      20000000
    ];

    for (int i = 0; i < maxValues.length; i++) {
      if (highestValue < maxValues[i]) {
        return maxValues[i];
      }
    }
    return maxValues[maxValues.length - 1];
  }

  void setState() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => generateBarChartDataFromMap());
  }
}
