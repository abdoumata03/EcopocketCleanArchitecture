// ignore_for_file: unused_result

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/repository/transactions_repository.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/home_screen.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/custom_navigation_bar.dart';
import 'package:ecopocket_clean_architecture/utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageIndexChangerProvider);
    final repo = ref.watch(transactionsRepositoryProvider);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: kGray[50],
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
            side: BorderSide(
              width: 4.w,
              color: Colors.white,
            ),
          ),
          onPressed: () => showTransactionTypesBottomSheet(context, repo, ref),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: SafeArea(
            child: IndexedStack(
          index: currentIndex,
          children: const [
            Center(child: HomePage()),
            Center(child: Text('Analytics Page')),
            Center(child: Text('Budget Page')),
            Center(child: Text('Profile Page'))
          ],
        )),
      ),
    );
  }

  Future<dynamic> showTransactionTypesBottomSheet(
      BuildContext context, TransactionsRepository repo, WidgetRef ref) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.h), topRight: Radius.circular(25.h))),
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Transaction Type',
                        style: GoogleFonts.jost(
                            color: kGray[500],
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 22.h,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await repo.createTransaction(
                            1004, "Expense", 1, null, "test", DateTime.now());
                        ref.refresh(getTodaysCategoriesInfoListProvider);
                        ref.refresh(todaysTotalProvider);
                        final period = ref
                            .watch(getDateRangeProvider(TimePeriod.thisWeek));
                        ref.refresh(getSpendingsProvider(range: period));

                        final cats = await repo.getTodaysCategoriesInfo();
                        log(cats.toString());
                      },
                      style: ButtonStyle(
                          alignment: Alignment.bottomCenter,
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 18.w)),
                          backgroundColor: MaterialStateProperty.all(kBlue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.h)),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/expense_arrow.svg'),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Expense',
                              style: GoogleFonts.jost(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ElevatedButton(
                      onPressed: () => log("Income"),
                      style: ButtonStyle(
                          alignment: Alignment.bottomCenter,
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 18.w)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(kGray[500]),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.h)),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/income_arrow.svg'),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text('Income',
                              style: GoogleFonts.jost(
                                  color: kGray[500],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp)),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        );
      },
    );
  }
}
