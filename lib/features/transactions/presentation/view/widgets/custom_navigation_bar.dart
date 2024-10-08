// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.h),
          topRight: Radius.circular(18.h),
        ),
        color: Colors.white,
        boxShadow: [bottomNavBoxShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildAppBarItem(
            ref: ref,
            index: 0,
            icon: 'assets/icons/home.svg',
            selectedIcon: 'assets/icons/home_filled.svg',
            page: context.loc.home,
          ),
          buildAppBarItem(
            ref: ref,
            index: 1,
            icon: 'assets/icons/analytics.svg',
            selectedIcon: 'assets/icons/analytics_filled.svg',
            page: context.loc.analytics,
          ),
          placeholder,
          buildAppBarItem(
            ref: ref,
            index: 2,
            icon: 'assets/icons/budget.svg',
            selectedIcon: 'assets/icons/budget_filled.svg',
            page: context.loc.budget,
          ),
          buildAppBarItem(
            ref: ref,
            index: 3,
            icon: 'assets/icons/more.svg',
            selectedIcon: 'assets/icons/more_filled.svg',
            page: context.loc.more,
          ),
        ],
      ),
    );
  }

  Widget buildAppBarItem(
      {required WidgetRef ref,
      required int index,
      required String icon,
      required String selectedIcon,
      required String page}) {
    bool isSelected = index == ref.watch(pageIndexChangerProvider);
    return InkWell(
      onTap: () =>
          ref.read(pageIndexChangerProvider.notifier).changePageIndex(index),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? selectedIcon : icon,
              color: isSelected ? kBlue : kGray[400],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Text(
                page,
                style: GoogleFonts.jost(
                  fontSize: 12.sp,
                  fontWeight: (isSelected ? FontWeight.w600 : FontWeight.w500),
                  color: isSelected ? kBlue : kGray[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndex extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void changePageIndex(int index) {
    state = index;
  }
}

final pageIndexChangerProvider =
    NotifierProvider<PageIndex, int>(PageIndex.new);
