import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/transaction.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/date_filter_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/transactions_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/all_transactions/widgets/transaction_item_widget.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/async_value_widget.dart';
import 'package:ecopocket_clean_architecture/shared/widgets/empty_transactions.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AllTransactions extends ConsumerStatefulWidget {
  const AllTransactions({super.key});

  @override
  ConsumerState createState() => _AllTransactionsState();
}

class _AllTransactionsState extends ConsumerState {
  var isSorted = false;
  @override
  Widget build(BuildContext context) {
    final transactions = ref.watch(transactionsControllerProvider);
    final isSorted =
        ref.watch(transactionsControllerProvider.notifier).isSorted;
    final selectedDateRange = ref.watch(dateFilterControllerProvider);
    final dateFormatter = ref.watch(dateFormatterProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        title: Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              icon: SvgPicture.asset('assets/icons/back.svg'),
            ),
            Text(context.loc.transactions,
                style: GoogleFonts.jost(
                  color: kGray[900],
                  fontSize: 18.sp,
                )),
            const Spacer(),
            IconButton(
                onPressed: () {
                  if (!isSorted) {
                    ref
                        .read(transactionsControllerProvider.notifier)
                        .sortByAmount();
                  } else {
                    ref.read(transactionsControllerProvider.notifier).unsort();
                  }
                },
                icon: SvgPicture.asset(
                  'assets/icons/sort.svg',
                  color: isSorted ? kBlue : kGray[900],
                )),
            IconButton(
              onPressed: () => pickDateRange(context, ref),
              icon: SvgPicture.asset('assets/icons/calendar.svg'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedDateRange != null)
                Chip(
                  backgroundColor: kBlue.withOpacity(0.1),
                  label: Text(
                    "${dateFormatter.format(selectedDateRange.start)} - ${dateFormatter.format(selectedDateRange.end)}",
                    style: GoogleFonts.jost(
                        color: kBlue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  deleteIconColor: kBlue,
                  onDeleted: () {
                    ref
                        .read(dateFilterControllerProvider.notifier)
                        .setDateRange(null);
                    ref.invalidate(transactionsControllerProvider);
                    ref.read(transactionsControllerProvider);
                  },
                ),
              if (selectedDateRange != null)
                SizedBox(
                  height: 18.h,
                ),
              AsyncValueWidget(
                  value: transactions,
                  data: (data) {
                    if (data.length == 0) {
                      return EmptyTransactions(
                          message: context.loc.noTransactions);
                    }
                    return ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final Transaction transaction = data[index];
                          return TransactionItem(
                            transaction: transaction,
                          );
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Future pickDateRange(BuildContext context, WidgetRef ref) async {
  DateTimeRange? newDateRange = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2023),
    lastDate: DateTime(2024),
    initialEntryMode: DatePickerEntryMode.input,
    initialDateRange: ref.watch(dateFilterControllerProvider),
    builder: (context, child) => Theme(
        data: ThemeData(
          textTheme: GoogleFonts.jostTextTheme(),
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: kBlue),
          ),
          primarySwatch: kBlue,
        ),
        child: child!),
  );

  if (newDateRange == null) return;

  ref.read(dateFilterControllerProvider.notifier).setDateRange(newDateRange);
  ref.read(transactionsControllerProvider.notifier).applyDateRangeFilter();

  return newDateRange;
}
