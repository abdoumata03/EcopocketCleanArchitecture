// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isNewPage = true,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isNewPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(
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
          ? Icon(FluentIcons.chevron_right_16_regular, color: kGray[500])
          : null,
      onTap: onTap,
    );
  }
}
