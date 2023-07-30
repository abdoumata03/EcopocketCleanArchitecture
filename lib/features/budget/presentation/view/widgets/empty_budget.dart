import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/budget/presentation/view/widgets/set_monthly_budget_button.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyBudget extends StatelessWidget {
  const EmptyBudget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [defaultBoxShadow]),
        child: Column(
          children: [
            SvgPicture.asset("assets/illustrations/budget.svg", height: 120.h),
            SizedBox(height: 20.h),
            Text(
              context.loc.noBudgetSet,
              style: GoogleFonts.jost(
                color: kGray[400],
                fontSize: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            const SetMonthlyBudgetButton()
          ],
        ),
      ),
    );
  }
}
