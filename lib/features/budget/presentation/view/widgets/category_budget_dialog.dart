// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/budget_amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/budget_type_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/slider_value_controller.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/controllers/update_category_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/providers/home_providers.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/localization/categories_localizations.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/input_formatters/amount_input_formatter.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
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
  final _formKey = GlobalKey<FormState>();

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
    final monthlyBudget =
        ref.watch(appSharedPreferenceProvider).getMonthlyBudget();
    final budgetCategories =
        ref.watch(getCategoriesProvider(CategoryType.budget));
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding:
            EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
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
                  AsyncValueWidget(
                      value: budgetCategories,
                      data: (data) {
                        final budgetTotal = data.categories
                            .where((element) => element != widget.category)
                            .fold<double>(
                                0,
                                (previousValue, element) =>
                                    previousValue + element.budgetAmount!);

                        return Flexible(
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              enabled: budgetType == BudgetTypes.amount,
                              controller: categoryBudgetTextController,
                              inputFormatters: [
                                DecimalTextInputFormatter(),
                                FilteringTextInputFormatter.deny(RegExp(','))
                              ],
                              onChanged: (value) {
                                ref
                                    .read(budgetAmountProvider.notifier)
                                    .onChange(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return context.loc.budgetRequired;
                                }
                                if (double.parse(value) <= 0) {
                                  return context.loc.budgetPositive;
                                }
                                if (budgetTotal + double.parse(value) >
                                    monthlyBudget) {
                                  return context.loc.monthlyBudgetExceeded;
                                }
                                return null;
                              },
                              style: GoogleFonts.jost(
                                color: budgetType == BudgetTypes.amount
                                    ? kGray[900]
                                    : kGray[500],
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: context.loc.budget,
                                errorMaxLines: 2,
                                errorStyle: TextStyle(
                                  color: kRed,
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kRed,
                                  ),
                                ),
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
                        );
                      }),
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
                      onChanged: (value) {
                        if (value) {
                          categoryBudgetTextController.text = "0";
                          ref
                              .read(sliderValueProvider(value: sliderValue)
                                  .notifier)
                              .change(0);
                        }
                        ref
                            .read(
                                budgetTypeProvider(budgetType: _type).notifier)
                            .toggle(value);
                      }),
                ],
              ),
              if (budgetType == BudgetTypes.percentage)
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: SfSlider(
                      value: sliderValue,
                      activeColor: kBlue,
                      inactiveColor: kBlue.withOpacity(0.1),
                      stepSize: 0.01,
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
              if (_formKey.currentState!.validate()) {
                context.pop();
                ref
                    .read(updateCategoryProvider.notifier)
                    .updateCategory(category: widget.category);
              }
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
