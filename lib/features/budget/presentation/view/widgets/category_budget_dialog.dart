// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/budget_amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/budget_type_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/slider_value_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/update_category_controller.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/localization/categories_localizations.dart';
import 'package:ecopocket_clean_architecture/utils/input_formatters/amount_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

final TextEditingController categoryBudgetTextController =
    TextEditingController();

class CategoryBudgetDialog extends ConsumerStatefulWidget {
  const CategoryBudgetDialog({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  CategoryBudgetDialogState createState() => CategoryBudgetDialogState();
}

class CategoryBudgetDialogState extends ConsumerState<CategoryBudgetDialog> {
  late final BudgetTypes _type;

  @override
  void initState() {
    super.initState();
    if (widget.category.budgetType == "percentage") {
      _type = BudgetTypes.percentage;
    } else {
      _type = BudgetTypes.amount;
    }
    if (widget.category.budgetAmount != null) {
      categoryBudgetTextController.text =
          widget.category.budgetAmount!.toStringAsFixed(0);
    } else {
      categoryBudgetTextController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final budgetType = ref.watch(budgetTypeProvider(budgetType: _type));
    final sliderValue =
        ref.watch(sliderValueProvider(value: widget.category.budgetPercentage));
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding:
            EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.h)),
        content: SizedBox(
          width: 300.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    widget.category.icon,
                    color: Color(int.parse(widget.category.color)),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    CategoriesLocalizations.getCategoryName(
                        context, widget.category.name),
                    style: GoogleFonts.jost(
                      color: kGray[500],
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      enabled: budgetType == BudgetTypes.amount,
                      controller: categoryBudgetTextController,
                      inputFormatters: [
                        DecimalTextInputFormatter(),
                        FilteringTextInputFormatter.deny(RegExp(','))
                      ],
                      onChanged: (value) {
                        ref.read(budgetAmountProvider.notifier).onChange(value);
                      },
                      style: GoogleFonts.jost(
                        color: kGray[900],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: context.loc.budget,
                        hintStyle: GoogleFonts.jost(
                          color: kGray[400],
                          fontSize: 16.sp,
                        ),
                        suffix: budgetType == BudgetTypes.percentage
                            ? Text(
                                NumberFormat.percentPattern()
                                    .format(sliderValue),
                                style: GoogleFonts.jost(
                                  color: kGray[400],
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            : null,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kGray[300]!,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kBlue[500]!,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.h),
                      color: kGray[100],
                    ),
                    child: Text(
                      'DZD',
                      style: GoogleFonts.jost(
                        color: kGray[400],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.loc.byPercentage,
                        style: GoogleFonts.jost(
                          color: kGray[500],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        context.loc.byPercentageDescription,
                        style: GoogleFonts.jost(
                          color: kGray[300],
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Switch(
                    value: budgetType == BudgetTypes.percentage,
                    activeColor: kGreen,
                    inactiveTrackColor: kGray[300],
                    onChanged: (value) => ref
                        .read(budgetTypeProvider(budgetType: _type).notifier)
                        .toggle(value),
                  ),
                ],
              ),
              if (budgetType == BudgetTypes.percentage)
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: SfSlider(
                      value: sliderValue,
                      activeColor: kBlue,
                      inactiveColor: kBlue.withOpacity(0.1),
                      stepSize: 0.05,
                      numberFormat: NumberFormat.percentPattern(),
                      enableTooltip: true,
                      onChanged: (value) => ref
                          .read(sliderValueProvider(
                                  value: widget.category.budgetPercentage)
                              .notifier)
                          .change(value)),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(kGray[400]),
              textStyle: MaterialStateProperty.all(
                GoogleFonts.jost(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: Text(context.loc.cancel),
          ),
          TextButton(
            onPressed: () {
              context.pop();
              ref
                  .read(updateCategoryProvider.notifier)
                  .updateCategory(category: widget.category);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(kBlue),
              textStyle: MaterialStateProperty.all(
                GoogleFonts.jost(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: Text(
              context.loc.save,
            ),
          )
        ]);
  }
}
