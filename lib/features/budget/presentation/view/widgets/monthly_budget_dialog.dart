import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/utils/input_formatters/amount_input_formatter.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthlyBudgetDialog extends ConsumerStatefulWidget {
  const MonthlyBudgetDialog({Key? key}) : super(key: key);

  @override
  MonthlyBudgetDialogState createState() => MonthlyBudgetDialogState();
}

class MonthlyBudgetDialogState extends ConsumerState<MonthlyBudgetDialog> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final double? monthlyBudget =
        ref.read(appSharedPreferenceProvider).getMonthlyBudget();
    if (monthlyBudget != null) {
      _controller.text = monthlyBudget.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sharedPrefs = ref.watch(appSharedPreferenceProvider);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding:
          EdgeInsets.only(top: 20.h, right: 25.w, left: 25.w, bottom: 20.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.h)),
      content: SizedBox(
        width: 300.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _controller,
                      inputFormatters: [
                        DecimalTextInputFormatter(),
                        FilteringTextInputFormatter.deny(RegExp(','))
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.loc.budgetRequired;
                        }
                        if (double.parse(value) <= 0) {
                          return context.loc.budgetPositive;
                        }
                        return null;
                      },
                      style: GoogleFonts.jost(
                        color: kGray[900],
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: context.loc.budget,
                        hintStyle: GoogleFonts.jost(
                          color: kGray[400],
                          fontSize: 16.sp,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kGray[300]!,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kBlue[500]!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.h),
                    color: kGray[100],
                  ),
                  child: Text(
                    'DZD',
                    style: GoogleFonts.jost(
                      color: kGray[400],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kGray[400]),
            textStyle: MaterialStateProperty.all(
              GoogleFonts.jost(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          child: Text(context.loc.cancel),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              sharedPrefs
                  .setMonthlyBudget(double.parse(_controller.text.trim()));
              ref.invalidate(appSharedPreferenceProvider);
              ref.read(appSharedPreferenceProvider);
              context.pop();
            }
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
            context.loc.save,
          ),
        )
      ],
    );
  }
}
