import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleItem extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const ToggleItem({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: selected
              ? Border.all(
                  color: kGray[300]!,
                  width: 1.5,
                )
              : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 22.w),
        child: Text(
          text,
          style: GoogleFonts.jost(
            fontSize: 17.sp,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? kGray[900] : kGray[400],
          ),
        ),
      ),
    );
  }
}
