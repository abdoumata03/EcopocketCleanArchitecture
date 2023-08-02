import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/amount_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AmountWidget extends ConsumerWidget {
  const AmountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(amountProvider);

    TextStyle style = GoogleFonts.jost(
        color: kGray[900], fontSize: 52.sp, fontWeight: FontWeight.w500);

    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: kGray[200]!,
                  width: 4.h,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          amount,
                          style: style.copyWith(height: 1.2),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text('DZD',
                        style: GoogleFonts.jost(
                            color: kGray[400], fontSize: 24.sp)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
