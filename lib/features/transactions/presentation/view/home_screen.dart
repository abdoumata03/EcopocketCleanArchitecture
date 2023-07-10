// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/empty_transactions.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/spent_this_week.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/today_categories_widget.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/view_all_transactions.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/yesterday_categories_widget.dart';
import 'package:ecopocket_clean_architecture/utils/multi_async_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todaysCategories = ref.watch(getTodaysCategoriesInfoListProvider);
    final todaysTotal = ref.watch(todaysTotalProvider);
    final yesterdaysCategories =
        ref.watch(getYesterdaysCategoriesInfoListProvider);
    final yesterdaysTotal = ref.watch(yesterdaysTotalProvider);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.h,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => log("Menu"),
                icon: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  color: kGray[900],
                ),
              ),
              Text(
                'Home',
                style: GoogleFonts.jost(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: kGray[900],
                ),
              ),
              Opacity(
                  opacity: 0,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_outlined))),
            ],
          ),
          backgroundColor: kGray[50],
          elevation: 0,
        ),
        body: [
          todaysCategories,
          yesterdaysCategories,
          todaysTotal,
          yesterdaysTotal
        ].when(
          data: (data) {
            var todaysCategoriesList = data.elementAt(0) as CategoryInfoList;
            var yesterdaysCategoriesList =
                data.elementAt(1) as CategoryInfoList;
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                const SpentThisWeek(),
                SizedBox(height: 14.h),
                buildViewAllTransactions(),
                SizedBox(height: 14.h),
                (todaysCategoriesList.categoryInfoList.isEmpty &&
                        yesterdaysCategoriesList.categoryInfoList.isEmpty)
                    ? const EmptyTransactions()
                    : Column(children: [
                        if (todaysCategoriesList.categoryInfoList.isNotEmpty)
                          const TodaysCategories(),
                        if (yesterdaysCategoriesList
                            .categoryInfoList.isNotEmpty)
                          SizedBox(height: 14.h),
                        if (yesterdaysCategoriesList
                            .categoryInfoList.isNotEmpty)
                          const YesterdaysCategories(),
                      ])
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const Text('Error'),
        ));
  }
}
