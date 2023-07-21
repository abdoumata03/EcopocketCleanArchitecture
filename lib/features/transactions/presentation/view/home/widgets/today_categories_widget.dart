import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/home/widgets/category_info_list_item.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TodaysCategories extends ConsumerWidget {
  const TodaysCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todaysCategories = ref.watch(getTodaysCategoriesInfoListProvider);
    final todaysTotal = ref.watch(todaysTotalProvider);
    final amountFormat = ref.watch(amountFormatterProvider);
    return Column(children: [
      Row(
        children: [
          Text(
            'Today',
            style: GoogleFonts.jost(color: kGray[500], fontSize: 16.sp),
          ),
          const Spacer(),
          todaysTotal.maybeWhen(
              data: (total) => Text(
                    '${amountFormat.format(total)} DZD',
                    style: GoogleFonts.jost(color: kGray[500], fontSize: 16.sp),
                  ),
              orElse: () => const Text('null')),
        ],
      ),
      SizedBox(height: 10.h),
      AsyncValueWidget(
          value: todaysCategories,
          data: (categories) {
            return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
                shrinkWrap: true,
                itemBuilder: (context, index) => CategoryInfoListItem(
                      category: categories[index],
                      period: "today",
                    ),
                itemCount: categories.length);
          }),
    ]);
  }
}
