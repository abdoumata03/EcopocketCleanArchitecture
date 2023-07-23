import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info.dart';
import 'package:ecopocket_clean_architecture/localization/categories_localizations.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

TimePeriod getTimePeriod(String period) {
  if (period == "today") {
    return TimePeriod.today;
  } else {
    return TimePeriod.yesterday;
  }
}

class CategoryTransactions extends ConsumerWidget {
  const CategoryTransactions(
      {super.key, required this.category, required this.period});
  final String period;
  final CategoryInfo category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat formatter = DateFormat('jm');
    final amountFormat = ref.watch(amountFormatterProvider);
    final range = ref.watch(getDateRangeProvider(getTimePeriod(period)));
    final transactions = ref.watch(
        getCategoryTransactionsProvider(range: range, categoryId: category.id));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        title: Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: SvgPicture.asset('assets/icons/back.svg'),
            ),
            SizedBox(width: 5.w),
            Text(
              'Transactions',
              style: GoogleFonts.jost(color: kGray[700], fontSize: 18.sp),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.h),
                  boxShadow: [defaultBoxShadow]),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: Color(int.parse(category.color)),
                          borderRadius: BorderRadius.circular(14.h)),
                      padding: EdgeInsets.all(13.h),
                      child: SvgPicture.asset(category.icon),
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            CategoriesLocalizations.getCategoryName(
                                context, category.name),
                            style: GoogleFonts.jost(
                                color: kGray[900],
                                fontWeight: FontWeight.w500)),
                        Text(
                          '${category.count} transactions',
                          style: GoogleFonts.jost(
                              color: kGray[500], fontSize: 14.sp),
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      '${amountFormat.format(category.total)} DZD',
                      style: GoogleFonts.jost(
                          color: kGray[900], fontWeight: FontWeight.w500),
                    )
                  ]),
                  SizedBox(height: 15.h),
                  const Divider(),
                  SizedBox(height: 10.h),
                  AsyncValueWidget(
                    value: transactions,
                    data: (data) {
                      return ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: ((context, index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/clock.svg',
                                              height: 15.h,
                                              color: kGray[700]),
                                          SizedBox(width: 6.w),
                                          Text(
                                            formatter.format(
                                                data[index].createdTime),
                                            style: GoogleFonts.jost(
                                                color: kGray[700],
                                                fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible:
                                            data[index].description.isNotEmpty,
                                        child: Text(
                                          data[index].description,
                                          style: GoogleFonts.jost(
                                              color: kGray[500],
                                              fontSize: 14.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                      '${amountFormat.format(data[index].amount)} DZD',
                                      style: GoogleFonts.jost(
                                          color: kGray[600],
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
