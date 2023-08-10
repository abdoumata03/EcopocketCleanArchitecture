// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isNewPage = true,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isNewPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      titleAlignment: ListTileTitleAlignment.center,
      leading: SvgPicture.asset(
        icon,
        color: kGray[400],
      ),
      horizontalTitleGap: 10.w,
      contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
      title: Text(
        title,
        style: GoogleFonts.jost(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: kGray[800],
        ),
      ),
      trailing: isNewPage
          ? SvgPicture.asset(
              'assets/icons/right_arrow.svg',
              color: kGray[800],
            )
          : null,
      onTap: onTap,
    );
  }
}
