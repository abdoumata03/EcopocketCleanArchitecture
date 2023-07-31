import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/transactions/providers/home_providers.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SpentThisWeek extends ConsumerWidget {
  const SpentThisWeek({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final period = ref.watch(getDateRangeProvider(TimePeriod.thisWeek));
    final spent = ref.watch(getSpendingsProvider(range: period));
    final amountFormatter = ref.watch(amountFormatterProvider);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 48.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [defaultBoxShadow]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          context.loc.spentThisWeek,
          style: GoogleFonts.jost(fontSize: 14.sp, color: kGray[500]),
        ),
        SizedBox(height: 4.h),
        AsyncValueWidget(
            value: spent,
            data: (data) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      amountFormatter.format(data),
                      style: GoogleFonts.jost(
                          color: kGray[700],
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "DZD",
                      style: GoogleFonts.jost(color: kGray[500]),
                    )
                  ],
                ))
      ]),
    );
  }
}
