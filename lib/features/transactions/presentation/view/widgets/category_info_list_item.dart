import 'dart:developer';

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryInfoListItem extends ConsumerWidget {
  const CategoryInfoListItem({
    super.key,
    required this.category,
  });
  final CategoryInfo category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountFormat = ref.watch(amountFormatterProvider);

    String getCountAdjective() {
      final count = category.count;
      if (count == 1) {
        return 'entry';
      } else {
        return 'entries';
      }
    }

    return InkWell(
      onTap: () => log('Category tapped'),
      borderRadius: BorderRadius.circular(8.r),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [defaultBoxShadow],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
              // boxShadow: [defaultBoxShadow],
              ),
          height: 80.h,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.h),
                  color: Color(int.parse(category.color)),
                ),
                padding: EdgeInsets.all(13.r),
                child: SvgPicture.asset(
                  category.icon,
                )),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category.name,
                  style: GoogleFonts.jost(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: kGray[900],
                  ),
                ),
                Text(
                  '${category.count} ${getCountAdjective()}',
                  style: GoogleFonts.jost(color: kGray[400], fontSize: 14.sp),
                )
              ],
            ),
            const Spacer(),
            Text('${amountFormat.format(category.total)} DZD',
                style: GoogleFonts.jost(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: kGray[700],
                )),
          ]),
        ),
      ),
    );
  }
}
