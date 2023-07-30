import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/monthly_budget_dialog.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SetMonthlyBudgetButton extends StatelessWidget {
  const SetMonthlyBudgetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBlue,
      borderRadius: BorderRadius.circular(5.r),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: ((context) {
                return MonthlyBudgetDialog();
              }));
        },
        child: Container(
          width: double.infinity,
          height: 50.h,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Center(
            child: Text(
              context.loc.setBudget,
              style: GoogleFonts.jost(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
