// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/budget/domain/model/category_list.dart';
import 'package:ecopocket_clean_architecture/features/transactions/application/category_info_service.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/category_controller.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/localization/categories_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseCategory extends ConsumerWidget {
  const ChooseCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(getCategoriesProvider);
    final category = ref.watch(chosenCategoryProvider);
    return InkWell(
      onTap: () => showCategoriesBottomSheet(context, categories, ref),
      child: Ink(
        color: Colors.white,
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: kGray[200]!,
                width: 1.h,
              ),
              bottom: BorderSide(
                color: kGray[200]!,
                width: 1.h,
              ),
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                (category != null)
                    ? SvgPicture.asset(
                        category.icon,
                        color: Color(int.parse(category.color)),
                      )
                    : const Icon(
                        Icons.attach_money,
                      ),
                SizedBox(width: 10.w),
                Text(
                  (category != null)
                      ? category.name
                      : context.loc.chooseCategory,
                  style: GoogleFonts.jost(
                      color: (category != null) ? kGray[700] : kGray[400],
                      fontWeight: (category != null)
                          ? FontWeight.w500
                          : FontWeight.w400,
                      fontSize: 18.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showCategoriesBottomSheet(BuildContext context,
      AsyncValue<CategoryList> categories, WidgetRef ref) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.h),
                topRight: Radius.circular(25.h))),
        context: context,
        builder: (context) => Wrap(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        context.loc.categories,
                        style: GoogleFonts.jost(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: kGray[400]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      categories.maybeWhen(
                          data: (data) {
                            return GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                children: [
                                  for (var category in data.categories)
                                    InkWell(
                                      onTap: () {
                                        ref
                                            .read(
                                                chosenCategoryProvider.notifier)
                                            .setCategory(category);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              height: 50.h,
                                              width: 50.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14.h),
                                                color: Color(
                                                    int.parse(category.color)),
                                              ),
                                              padding: EdgeInsets.all(13.r),
                                              child: SvgPicture.asset(
                                                category.icon,
                                              )),
                                          SizedBox(height: 10.h),
                                          Text(
                                            CategoriesLocalizations
                                                .getCategoryName(
                                                    context, category.name),
                                            style: GoogleFonts.jost(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: kGray[600]),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    )
                                ]);
                          },
                          orElse: () =>
                              const Center(child: CircularProgressIndicator()))
                    ],
                  ),
                )
              ],
            ));
  }
}
