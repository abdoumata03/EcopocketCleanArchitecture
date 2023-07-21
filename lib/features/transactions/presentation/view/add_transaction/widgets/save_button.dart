import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/category_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/note_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/save_transaction_controller.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveTransactionButton extends ConsumerWidget {
  const SaveTransactionButton({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(amountProvider);
    final category = ref.watch(chosenCategoryProvider);
    return GestureDetector(
      onTap: (amount != '0' && category != null)
          ? () {
              ref.read(newTransactionProvider.notifier).saveTranscation(
                  amount: double.parse(ref.watch(amountProvider)),
                  type: type,
                  category: ref.watch(chosenCategoryProvider)!.id,
                  wallet: null,
                  description: ref.watch(noteProvider),
                  createdTime: DateTime.now());

              context.pop();
            }
          : null,
      child: Container(
        height: 65.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: (amount != '0' && category != null) ? kBlue : kGray[300],
        ),
        child: Center(
          child: Text(
            context.loc.save,
            style: GoogleFonts.jost(
              color: (amount != '0' && category != null)
                  ? Colors.white
                  : kGray[500],
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
