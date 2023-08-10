// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category_list.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/budget_hint.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/category_budget_dialog.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/category_budget_widget.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/empty_budget.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/monthly_budget_widget.dart';
import 'package:ecopocket_clean_architecture/features/transactions/providers/home_providers.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/localization/categories_localizations.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Budget extends ConsumerStatefulWidget {
  const Budget({super.key});

  @override
  BudgetState createState() => BudgetState();
}

class BudgetState extends ConsumerState<Budget> {
  bool isBudgetHintVisible = true;
  @override
  Widget build(BuildContext context) {
    final monthlyBudget =
        ref.watch(appSharedPreferenceProvider).getMonthlyBudget();
    final noBudgetCategories =
        ref.watch(getCategoriesProvider(CategoryType.noBudget));
    final budgetCategories =
        ref.watch(getCategoriesProvider(CategoryType.budget));
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
              const Spacer(),
              AsyncValueWidget(
                  value: noBudgetCategories,
                  data: (data) {
                    if (monthlyBudget != null && data.categories.isNotEmpty) {
                      return IconButton(
                        onPressed: () => showCategoriesBottomSheet(
                            context, noBudgetCategories, ref),
                        icon: SvgPicture.asset(
                          'assets/icons/add.svg',
                          color: kGray[900],
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
            ],
          ),
          backgroundColor: kGray[50],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 10.h, bottom: 25.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (isBudgetHintVisible)
                  BudgetHint(
                    onTap: () => setState(() => isBudgetHintVisible = false),
                  ),
                (monthlyBudget == null)
                    ? const EmptyBudget()
                    : const MonthlyBudgetWidget(),
                Divider(
                  height: 30.h,
                ),
                AsyncValueWidget(
                    value: budgetCategories,
                    data: (data) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 12.h,
                              ),
                          itemBuilder: (context, index) {
                            final category = data[index];
                            return CategoryBudgetWidget(category: category);
                          });
                    })
              ],
            ),
          ),
        ));
  }
}

Future<dynamic> showCategoriesBottomSheet(
    BuildContext context, AsyncValue<CategoryList> categories, WidgetRef ref) {
  return showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.h), topRight: Radius.circular(25.h))),
    context: context,
    builder: (context) => Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  context.loc.chooseCategory,
                  style: GoogleFonts.jost(
                    color: kGray[500],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              categories.maybeWhen(
                  data: (data) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          children: [
                            for (var category in data.categories)
                              InkWell(
                                onTap: () {
                                  context.pop();
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CategoryBudgetDialog(
                                          category: category,
                                        );
                                      });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.h),
                                          color:
                                              Color(int.parse(category.color)),
                                        ),
                                        padding: EdgeInsets.all(13.r),
                                        child: SvgPicture.asset(
                                          category.icon,
                                        )),
                                    SizedBox(height: 10.h),
                                    Text(
                                      CategoriesLocalizations.getCategoryName(
                                          context, category.name),
                                      style: GoogleFonts.jost(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: kGray[600]),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )
                          ]),
                    );
                  },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()))
            ],
          ),
        )
      ],
    ),
  );
}
