// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/analytics_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/period_controller.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/view/widgets/bar_chart.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/view/widgets/category_stat_item.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/view/widgets/pie_chart.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/view/widgets/stat_item_list_skeleton.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/view/widgets/toggle_item.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/localization/string_hardcoded.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/empty_transactions.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';

import 'package:ecopocket_clean_architecture/utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Analytics extends ConsumerStatefulWidget {
  const Analytics({super.key});

  @override
  ConsumerState createState() => _AnalyticsState();
}

class _AnalyticsState extends ConsumerState {
  int selectedIndex = 0;
  bool isPieChartVisible = false;

  @override
  Widget build(BuildContext context) {
    final stats = ref.watch(analyticsControllerProvider);
    final periodController = ref.watch(periodControllerProvider);
    final range = ref.watch(getDateRangeProvider(periodController));
    final formatter = ref.watch(amountFormatterProvider);
    final spending = ref.watch(getSpendingsProvider(range: range));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: kGray[900],
              ),
            ),
          ],
        ),
        backgroundColor: kGray[50],
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 25.h),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [defaultBoxShadow],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spending.maybeWhen(
                      orElse: () {
                        return const Expanded(child: SizedBox());
                      },
                      data: (data) => Text(
                        formatter.format(data),
                        style: GoogleFonts.jost(
                            fontSize: 42.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2),
                      ),
                    ),
                    Text(
                      'DZD',
                      style:
                          GoogleFonts.jost(color: kGray[400], fontSize: 16.sp),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  'Total spent this week'.hardcoded,
                  style: GoogleFonts.jost(color: kGray[400]),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: SizedBox(
                    height: 250.h,
                    child: CustomBarChart(
                      key: myKey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              ToggleItem(
                text: 'Week',
                selected: selectedIndex == 0,
                onTap: () async {
                  setState(() {
                    selectedIndex = 0;
                  });
                  ref
                      .read(periodControllerProvider.notifier)
                      .toggle(TimePeriod.thisWeek);
                  ref
                      .read(analyticsControllerProvider.notifier)
                      .toggle(TimePeriod.thisWeek);
                },
              ),
              SizedBox(width: 10.w),
              ToggleItem(
                text: 'Month',
                selected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  ref
                      .read(periodControllerProvider.notifier)
                      .toggle(TimePeriod.thisMonth);
                  ref
                      .read(analyticsControllerProvider.notifier)
                      .toggle(TimePeriod.thisMonth);
                },
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    isPieChartVisible = !isPieChartVisible;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                        color: isPieChartVisible ? kGray[600]! : kGray[300]!),
                  ),
                  child: SvgPicture.asset(
                    isPieChartVisible
                        ? 'assets/icons/pie_chart_filled.svg'
                        : 'assets/icons/pie_chart.svg',
                    color: isPieChartVisible ? kGray[900] : kGray[500],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          stats.when(
              loading: () => const StatItemListSkeleton(),
              error: (error, stack) => const SizedBox(),
              data: (stats) {
                return (stats.length > 0)
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [defaultBoxShadow],
                        ),
                        padding: EdgeInsets.only(
                          right: 20.w,
                          left: 20.w,
                          bottom: 30.h,
                          top: isPieChartVisible ? 0 : 30.h,
                        ),
                        child: Column(
                          children: [
                            Visibility(
                                visible: isPieChartVisible && stats.length > 0,
                                child: CustomPieChart(stats: stats)),
                            ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: stats.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemBuilder: (context, index) {
                                  final statItem = stats[index];
                                  return CategoryStatItem(
                                    index: index,
                                    categoryInfo: statItem,
                                    period: periodController,
                                  );
                                })
                          ],
                        ),
                      )
                    : const EmptyTransactions(message: 'No transactions found');
              }),
        ],
      ),
    );
  }
}
