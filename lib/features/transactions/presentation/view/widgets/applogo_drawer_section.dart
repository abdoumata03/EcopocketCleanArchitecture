import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogoSection extends StatelessWidget {
  const AppLogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 38.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
              boxShadow: [defaultBoxShadow],
            ),
            child: SvgPicture.asset(
              'assets/icons/app_logo.svg',
              height: 60.h,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              'ecopocket',
              style: GoogleFonts.jost(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: kGray[600],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: kBlue[200],
            ),
            child: Text(
              'Version: 1.0.0',
              style: GoogleFonts.jost(color: kBlue),
            ),
          )
        ],
      ),
    );
  }
}
