import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/category_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/note_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/save_transaction_controller.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmBudgetExceededDialog extends ConsumerWidget {
  const ConfirmBudgetExceededDialog({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding:
          EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
      content: SizedBox(
        width: 300.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.jost(
                color: kGray[900],
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              description,
              style: GoogleFonts.jost(
                  color: kGray[500],
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kGray[400]),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.jost(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          child: Text(context.loc.cancel),
        ),
        TextButton(
          onPressed: () {
            ref.read(newTransactionProvider.notifier).saveTranscation(
                  amount: double.parse(ref.watch(amountProvider)),
                  type: 'Expense',
                  category: ref.watch(chosenCategoryProvider)!.id,
                  wallet: null,
                  description: ref.watch(noteProvider),
                  createdTime: DateTime.now(),
                );
            context.goNamed(AppRoute.home.name);
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kBlue),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.jost(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: Text(
            context.loc.confirm,
          ),
        ),
      ],
    );
  }
}
