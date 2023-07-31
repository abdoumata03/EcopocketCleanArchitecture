// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalBottomSheetButton extends StatelessWidget {
  const ModalBottomSheetButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onTap,
      required this.color});
  final String text;
  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        width: double.infinity,
        child: Row(
          children: [
            SvgPicture.asset(icon, height: 20.h, color: color),
            SizedBox(width: 15.w),
            Text(
              text,
              style: GoogleFonts.jost(
                color: color,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
