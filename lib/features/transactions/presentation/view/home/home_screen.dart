// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/empty_transactions.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/home/widgets/spent_this_week.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/home/widgets/today_categories_widget.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/home/widgets/view_all_transactions.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/home/widgets/yesterday_categories_widget.dart';
import 'package:ecopocket_clean_architecture/utils/multi_async_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
              padding: EdgeInsets.only(right: 20.w, left: 20.w, bottom: 25.h),
              children: [
                const SpentThisWeek(),
                SizedBox(height: 14.h),
                buildViewAllTransactions(
                    onTap: () => context.push("/all_transactions")),
                SizedBox(height: 14.h),
                (todaysCategoriesList.categoryInfoList.isEmpty &&
                        yesterdaysCategoriesList.categoryInfoList.isEmpty)
                    ? const EmptyTransactions(
                        message: 'You have no recent transactions!',
                      )
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
