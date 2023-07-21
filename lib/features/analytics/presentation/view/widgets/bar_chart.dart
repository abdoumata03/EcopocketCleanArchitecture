// ignore_for_file: library_private_types_in_public_api

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/barchart_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/max_value_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/period_controller.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:ecopocket_clean_architecture/utils/date_periods.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

GlobalKey<_CustomBarChartState> myKey = GlobalKey<_CustomBarChartState>();

class CustomBarChart extends ConsumerStatefulWidget {
  const CustomBarChart({super.key});

  @override
  ConsumerState createState() => _CustomBarChartState();
}

class _CustomBarChartState extends ConsumerState {
  int touchedIndex = -1;
  late double? maxValue = 0;
  @override
  Widget build(BuildContext context) {
    final formatter = ref.watch(amountFormatterProvider);
    final barChartGroupData = ref.watch(barChartDataMapControllerProvider);
    final maxVal = ref.watch(maxValueControllerProvider);
    final period = ref.watch(periodControllerProvider);

    return barChartGroupData.when(
        error: (error, stackTrace) {
          return const Center(
            child: Text('Error'),
          );
        },
        loading: () => Center(
                child: CircularProgressIndicator(
              color: kGray[900],
            )),
        data: (data) {
          final widgetState = myKey.currentState;
          widgetState!.maxValue = maxVal;
          final hasNoData = data.values.every((element) => element == 0);
          return Stack(
            alignment: Alignment.center,
            children: [
              if (hasNoData)
                Text(
                  'NO DATA AVAILABLE',
                  style: GoogleFonts.jost(
                      color: kGray[500],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              Opacity(
                opacity: hasNoData ? 0.4 : 1,
                child: BarChart(
                  BarChartData(
                    maxY: maxVal,
                    barTouchData: BarTouchData(
                      enabled: (period == TimePeriod.thisWeek) ? true : false,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${formatter.format(rod.toY)} DZD',
                            GoogleFonts.jost(color: Colors.white),
                          );
                        },
                      ),
                      touchCallback: (period == TimePeriod.thisWeek)
                          ? (FlTouchEvent event, barTouchResponse) {
                              if (event is FlTapDownEvent) {
                                setState(() {
                                  touchedIndex = barTouchResponse
                                          ?.spot?.touchedBarGroupIndex ??
                                      -1;
                                });
                              }
                            }
                          : null,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (period == TimePeriod.thisMonth)
                              ? monthlyBottomTitles
                              : weeklyBottomTitles,
                          interval: 1,
                          reservedSize: 20.h,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: !hasNoData,
                          getTitlesWidget: leftTitles,
                          interval: 1000,
                          reservedSize: 48,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        right: BorderSide.none,
                        left: BorderSide.none,
                        top: BorderSide(
                          width: 1,
                          color: kGray[300]!,
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: kGray[200]!,
                        ),
                      ),
                    ),
                    barGroups: List.generate(data.entries.length, (i) {
                      return makeGroupData(i, data[i]!,
                          touchedIndex: touchedIndex, period: period);
                    }),
                    gridData: FlGridData(
                      drawHorizontalLine: true,
                      drawVerticalLine: false,
                      horizontalInterval: 1,
                      checkToShowHorizontalLine: (value) {
                        List<int> intervals = [];
                        int interval = maxValue! ~/ 4;

                        for (int i = 0; i <= 4; i++) {
                          int value = i * interval;
                          intervals.add(value);
                        }

                        if (intervals.contains(value)) return true;
                        return false;
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget weeklyBottomTitles(double value, TitleMeta meta) {
    final weekTitles = <String>['Su', 'Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St'];
    bool isHighlighted() {
      bool isTouched = value.toInt() == touchedIndex;
      if (isTouched) return true;
      if (!isTouched && touchedIndex == -1) return true;
      return false;
    }

    final Widget text = Text(
      weekTitles[value.toInt()],
      style: TextStyle(
        color: isHighlighted() ? kGray[500] : kGray[300],
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3, //margin top
      child: text,
    );
  }

  Widget monthlyBottomTitles(double value, TitleMeta meta) {
    final monthTitles = <String>['0', '7', '14', '21', '28'];
    String textValue = '';

    bool isHighlighted() {
      bool isTouched = value.toInt() == touchedIndex;
      if (isTouched) return true;
      if (!isTouched && touchedIndex == -1) return true;
      return false;
    }

    if (monthTitles.contains(value.toInt().toString())) {
      textValue = value.toStringAsFixed(0);
    } else {
      return const SizedBox();
    }

    final Widget text = Text(
      textValue,
      style: TextStyle(
        color: isHighlighted() ? kGray[500] : kGray[300],
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return text;
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: const Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 13.sp,
    );

    String text = '';

    List<int> intervals = [];
    int interval = maxValue! ~/ 2;

    for (int i = 0; i <= 2; i++) {
      int value = i * interval;
      intervals.add(value);
    }

    int index = intervals.indexOf(value.toInt());

    if (index != -1) {
      if (intervals[index] > 10000) {
        double formattedValue = intervals[index] / 1000.0;
        text = '${formattedValue.toStringAsFixed(0)}K';
      } else {
        text = '${intervals[index]}';
      }
    } else {
      return const SizedBox();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3, //margin top
      child: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}

BarChartGroupData makeGroupData(int x, double y1,
    {int? touchedIndex, TimePeriod? period}) {
  bool isHighlighted() {
    bool isTouched = x == touchedIndex;
    if (isTouched) return true;
    if (!isTouched && touchedIndex == -1) return true;
    return false;
  }

  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    showingTooltipIndicators: touchedIndex == x ? [0] : [],
    barRods: [
      BarChartRodData(
        toY: y1,
        color: isHighlighted() ? kBlue : kGray[200],
        width: (period == TimePeriod.thisWeek) ? 24.w : 4.w,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
    ],
  );
}
