import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyTransactions extends StatelessWidget {
  const EmptyTransactions({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [defaultBoxShadow]),
      child: Column(children: [
        SvgPicture.asset(
          'assets/illustrations/placeholder.svg',
          height: 120.h,
        ),
        Text(message,
            style: GoogleFonts.jost(color: kGray[400], fontSize: 16.sp))
      ]),
    );
  }
}
