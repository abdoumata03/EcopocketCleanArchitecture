import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
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
            page: 'Home',
          ),
          buildAppBarItem(
            ref: ref,
            index: 1,
            icon: 'assets/icons/analytics.svg',
            selectedIcon: 'assets/icons/analytics_filled.svg',
            page: 'Analytics',
          ),
          placeholder,
          buildAppBarItem(
            ref: ref,
            index: 2,
            icon: 'assets/icons/budget.svg',
            selectedIcon: 'assets/icons/budget_filled.svg',
            page: 'Budget',
          ),
          buildAppBarItem(
            ref: ref,
            index: 3,
            icon: 'assets/icons/profile.svg',
            selectedIcon: 'assets/icons/profile_filled.svg',
            page: 'Profile',
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
    return InkWell(
      onTap: () =>
          ref.read(pageIndexChangerProvider.notifier).changePageIndex(index),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset((index == ref.watch(pageIndexChangerProvider))
                ? selectedIcon
                : icon),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Text(
                page,
                style: GoogleFonts.jost(
                  fontSize: 12.sp,
                  fontWeight: (index == ref.watch(pageIndexChangerProvider)
                      ? FontWeight.w600
                      : FontWeight.w500),
                  color: (index == ref.watch(pageIndexChangerProvider))
                      ? kBlue
                      : kGray[400],
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
