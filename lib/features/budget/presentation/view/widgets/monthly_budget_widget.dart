// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/confirm_delete_dialog.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/modal_button.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/monthly_budget_dialog.dart';
import 'package:ecopocket_clean_architecture/features/transactions/providers/home_providers.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:ecopocket_clean_architecture/utils/percentage_calculator.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MonthlyBudgetWidget extends ConsumerWidget {
  const MonthlyBudgetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyBudget =
        ref.watch(appSharedPreferenceProvider).getMonthlyBudget();
    final range = ref.watch(getDateRangeProvider(TimePeriod.thisMonth));
    final spendings = ref.watch(getSpendingsProvider(range: range));
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onLongPress: () => showMonthlyBudgetModal(context, ref),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          boxShadow: [defaultBoxShadow],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: double.infinity,
          child: AsyncValueWidget(
            value: spendings,
            data: (data) {
              final percentage = ref.read(calculatePercentageProvider(
                  amount: data, total: monthlyBudget));
              log(percentage.toString());
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        context.loc.monthlyBudget,
                        style: GoogleFonts.jost(
                          color: kGray[400],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      if (percentage == 100)
                        SvgPicture.asset(
                          'assets/icons/warning.svg',
                          color: kRed,
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AsyncValueWidget(
                        value: spendings,
                        data: (data) => Text(
                          '${data.toStringAsFixed(0)} DZD',
                          style: GoogleFonts.jost(
                            color: kGray[800],
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        '${percentage.toStringAsFixed(0)}%',
                        style: GoogleFonts.jost(
                          color: kGray[400],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${monthlyBudget.toStringAsFixed(0)} DZD',
                        style: GoogleFonts.jost(
                          color: kGray[400],
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  LinearPercentIndicator(
                    lineHeight: 8.h,
                    padding: EdgeInsets.zero,
                    barRadius: Radius.circular(8.r),
                    percent: percentage / 100,
                    backgroundColor: kGray[200],
                    progressColor: kBlue,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<dynamic> showMonthlyBudgetModal(BuildContext context, WidgetRef ref) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.h), topRight: Radius.circular(10.h))),
      builder: ((context) {
        return Wrap(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    context.loc.monthlyBudget,
                    style: GoogleFonts.jost(
                      color: kGray[500],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ModalBottomSheetButton(
                    icon: 'assets/icons/edit.svg',
                    text: context.loc.edit,
                    color: kGray[800]!,
                    onTap: () async {
                      context.pop();
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return const MonthlyBudgetDialog();
                          });
                    }),
                const Divider(
                  height: 0,
                ),
                ModalBottomSheetButton(
                  text: context.loc.delete,
                  icon: 'assets/icons/delete.svg',
                  onTap: () {
                    context.pop();
                    showDialog(
                      context: context,
                      builder: (context) => const ConfirmDeleteBudgetDialog(),
                    );
                  },
                  color: kRed,
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
