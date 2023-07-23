import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/utils/amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionItem extends ConsumerWidget {
  const TransactionItem({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountFormatter = ref.watch(amountFormatterProvider);
    final DateFormat dateFormatter = DateFormat('jm');

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.categoryName.toString(),
              style: GoogleFonts.jost(
                color: kGray[900],
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(dateFormatter.format(transaction.createdTime),
                style: GoogleFonts.jost(color: kGray[400])),
            SizedBox(height: 5.h),
            Visibility(
              visible: transaction.description.isNotEmpty,
              child: Text(transaction.description,
                  style: GoogleFonts.jost(
                      color: kGray[500], fontWeight: FontWeight.w500)),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '${amountFormatter.format(transaction.amount)}DZD',
          style: GoogleFonts.jost(
            color: kGray[600],
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
