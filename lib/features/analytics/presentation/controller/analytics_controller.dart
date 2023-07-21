import 'package:ecopocket_clean_architecture/features/analytics/domain/module.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/touched_index_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics_controller.g.dart';

@Riverpod(keepAlive: true)
class AnalyticsController extends _$AnalyticsController {
  Future<CategoryInfoList> _getStats(TimePeriod period) async {
    final range = ref.watch(getDateRangeProvider(period));
    final thing =
        await ref.watch(analyticsRepositoryProvider).getCategoryStats(range);
    return thing;
  }

  @override
  Future<CategoryInfoList> build() {
    return _getStats(TimePeriod.thisWeek);
  }

  void toggle(TimePeriod period) async {
    // state = state.copyWithPrevious(state);
    state = await AsyncValue.guard(() => _getStats(period));
  }
}

@riverpod
List<PieChartSectionData> pieChartSections(
    PieChartSectionsRef ref, CategoryInfoList stats) {
  final pieTouchedIndex = ref.watch(touchedIndexControllerProvider);
  final sections = List.generate(stats.length, (index) {
    return PieChartSectionData(
      color: Color(int.parse(stats[index].color)),
      value: stats[index].total,
      title: '',
      titleStyle: GoogleFonts.jost(fontSize: 15.h, color: Colors.white),
      radius: index == pieTouchedIndex ? 95.r : 90.r,
    );
  });
  return sections;
}
