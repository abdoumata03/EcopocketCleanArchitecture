import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/analytics_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/touched_index_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPieChart extends ConsumerWidget {
  const CustomPieChart({
    super.key,
    required this.stats,
  });

  final CategoryInfoList stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = ref.watch(pieChartSectionsProvider(stats));
    ref.watch(touchedIndexControllerProvider);

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 240.h,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  ref
                      .read(touchedIndexControllerProvider.notifier)
                      .setIndex(-1);
                  return;
                }
                final newIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
                ref
                    .read(touchedIndexControllerProvider.notifier)
                    .setIndex(newIndex);
              },
            ),
            sectionsSpace: 1,
            startDegreeOffset: 180,
            centerSpaceRadius: 0,
            sections: sections,
          ),
        ),
      ),
    );
  }
}
