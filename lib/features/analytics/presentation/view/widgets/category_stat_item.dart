import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/analytics/presentation/controller/touched_index_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:ecopocket_clean_architecture/utils/date_periods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryStatItem extends ConsumerWidget {
  const CategoryStatItem({
    super.key,
    required this.categoryInfo,
    required this.period,
    required this.index,
  });

  final CategoryInfo categoryInfo;
  final TimePeriod period;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountFormatter = ref.watch(amountFormatterProvider);
    final total = amountFormatter.format(categoryInfo.total);
    final name = categoryInfo.name;
    final count = categoryInfo.count;
    final color = categoryInfo.color;
    final percentage = amountFormatter.format(categoryInfo.percentage);
    final pieTouchedIndex = ref.watch(touchedIndexControllerProvider);

    return Opacity(
      opacity: (index == pieTouchedIndex || pieTouchedIndex == -1) ? 1 : 0.4,
      child: Row(
        children: [
          Container(
            height: 18.h,
            width: 18.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Color(int.parse(color))),
          ),
          SizedBox(width: 12.r),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.jost(
                  color: kGray[900],
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text('$count transactions',
                  style: GoogleFonts.jost(color: kGray[400]))
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$total DZD',
                style: GoogleFonts.jost(
                  color: kGray[600],
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text("$percentage%", style: GoogleFonts.jost(color: kGray[400]))
            ],
          ),
        ],
      ),
    );
  }
}
