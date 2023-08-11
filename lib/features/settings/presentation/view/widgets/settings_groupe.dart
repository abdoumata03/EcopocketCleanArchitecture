import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsGroupe extends StatelessWidget {
  const SettingsGroupe({super.key, required this.children, this.title});

  final List<Widget> children;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
            child: Text(
              title!,
              style: GoogleFonts.jost(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: kGray[500],
              ),
            ),
          ),
        Container(
          margin: EdgeInsets.only(bottom: 15.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: kGray[200]!,
                width: 1,
              ),
              top: BorderSide(
                color: kGray[200]!,
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
