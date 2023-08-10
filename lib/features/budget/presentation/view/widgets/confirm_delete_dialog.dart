import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/module.dart';
import 'package:ecopocket_clean_architecture/features/transactions/providers/home_providers.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmDeleteBudgetDialog extends ConsumerWidget {
  const ConfirmDeleteBudgetDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding:
          EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
      content: SizedBox(
        width: 300.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.loc.confirmDeleteMonthlyBudgetTitle,
              style: GoogleFonts.jost(
                color: kGray[900],
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              context.loc.confirmDeleteMonthlyBudgetDescription,
              style: GoogleFonts.jost(
                  color: kGray[500],
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
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
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          child: Text(context.loc.cancel),
        ),
        TextButton(
          onPressed: () {
            ref.read(appSharedPreferenceProvider).deleteMonthlyBudget();
            ref.invalidate(appSharedPreferenceProvider);
            ref.read(appSharedPreferenceProvider);
            ref.read(budgetRepositoryProvider).resetBudget();
            ref.invalidate(getCategoriesProvider(CategoryType.budget));
            context.pop();
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kRed),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.jost(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: Text(
            context.loc.confirm,
          ),
        )
      ],
    );
  }
}
