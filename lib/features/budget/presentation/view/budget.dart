// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/empty_budget.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/monthly_budget_widget.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Budget extends ConsumerWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthlyBudget =
        ref.watch(appSharedPreferenceProvider).getMonthlyBudget();
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
              if (monthlyBudget != null)
                IconButton(
                  onPressed: () => log('ADD'),
                  icon: SvgPicture.asset(
                    'assets/icons/add.svg',
                    color: kGray[900],
                  ),
                )
            ],
          ),
          backgroundColor: kGray[50],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                (monthlyBudget == null)
                    ? const EmptyBudget()
                    : const MonthlyBudgetWidget(),
              ],
            ),
          ),
        ));
  }
}
