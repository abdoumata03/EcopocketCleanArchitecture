import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetHint extends StatelessWidget {
  const BudgetHint({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.h),
        color: kBlue,
      ),
      padding:
          EdgeInsets.only(left: 20.w, right: 10.w, top: 15.h, bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/lightbulb.svg',
          ),
          SizedBox(width: 20.w),
          Flexible(
            child: Text(
              'Click the plus icon to add a monthly budget for each of your spending categories.',
              style: GoogleFonts.jost(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 2,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: onTap,
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 22.h,
            ),
          )
        ],
      ),
    );
  }
}
