import 'dart:developer';

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

InkWell buildViewAllTransactions({required VoidCallback onTap}) {
  return InkWell(
    onTap: () => onTap(),
    borderRadius: BorderRadius.circular(8.r),
    child: Ink(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: kGray[200]!),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(children: [
            Text(
              'View all transactions',
              style: GoogleFonts.jost(
                color: kGray[700],
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/right_arrow.svg')
          ]),
        ),
      ),
    ),
  );
}
