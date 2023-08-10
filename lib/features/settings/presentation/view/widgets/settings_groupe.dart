import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsGroupe extends StatelessWidget {
  const SettingsGroupe({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
