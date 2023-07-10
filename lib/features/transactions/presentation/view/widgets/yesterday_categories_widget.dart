import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/category_info_list_item.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class YesterdaysCategories extends ConsumerWidget {
  const YesterdaysCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yesterdaysCategories =
        ref.watch(getYesterdaysCategoriesInfoListProvider);
    final yesterdaysTotal = ref.watch(yesterdaysTotalProvider);
    final amountFormat = ref.watch(amountFormatterProvider);
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Yesterday',
              style: GoogleFonts.jost(color: kGray[500], fontSize: 16.sp),
            ),
            const Spacer(),
            yesterdaysTotal.maybeWhen(
                data: (total) => Text(
                      '${amountFormat.format(total)} DZD',
                      style:
                          GoogleFonts.jost(color: kGray[500], fontSize: 16.sp),
                    ),
                orElse: () => const Text('null')),
          ],
        ),
        SizedBox(height: 10.h),
        AsyncValueWidget(
            value: yesterdaysCategories,
            data: (categories) {
              return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                  itemBuilder: (context, index) => CategoryInfoListItem(
                        category: categories[index],
                      ),
                  itemCount: categories.length);
            }),
      ],
    );
  }
}
