// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/module.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/category_budget_dialog.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/confirm_delete_category_budget.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/modal_button.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/localization/categories_localizations.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_periods.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_provider.dart';
import 'package:ecopocket_clean_architecture/utils/percentage_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CategoryBudgetWidget extends ConsumerWidget {
  const CategoryBudgetWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final range = ref.watch(getDateRangeProvider(TimePeriod.thisMonth));
    final totalSpending = ref.watch(categorySpendingProvider(
      categoryId: category.id,
      dateRange: range,
    ));
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onLongPress: () => showCategoryBudgetModal(context, ref),
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
              value: totalSpending,
              data: (data) {
                final percentage = ref.watch(
                  calculatePercentageProvider(
                      amount: data, total: category.budgetAmount!),
                );
                final formatter =
                    NumberFormat.decimalPatternDigits(decimalDigits: 0);
                return Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          category.icon,
                          color: Color(int.parse(category.color)),
                          width: 15.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          CategoriesLocalizations.getCategoryName(
                              context, category.name),
                          style: GoogleFonts.jost(
                            color: kGray[400],
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${data.toStringAsFixed(0)}DZD',
                          style: GoogleFonts.jost(
                            color: kGray[800],
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '${formatter.format(percentage)}%',
                          style: GoogleFonts.jost(
                            color: kGray[400],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${category.budgetAmount!.toStringAsFixed(0)} DZD',
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
                      progressColor: Color(int.parse(category.color)),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Future<dynamic> showCategoryBudgetModal(BuildContext context, WidgetRef ref) {
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
                    "Budget classé",
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
                            return CategoryBudgetDialog(
                              category: category,
                            );
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
                      builder: (context) =>
                          ConfirmDeleteCategoryBudgetDialog(category: category),
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
