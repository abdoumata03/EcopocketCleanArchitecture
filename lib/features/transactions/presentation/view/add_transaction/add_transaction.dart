// ignore_for_file: deprecated_member_use, no_logic_in_create_state

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/amount_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/note_controller.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/add_transaction/widgets/amount.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/add_transaction/widgets/choose_category.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/add_transaction/widgets/keyboard_key.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/add_transaction/widgets/note_button.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/add_transaction/widgets/note_text_field.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/add_transaction/widgets/save_button.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTransaction extends ConsumerStatefulWidget {
  const NewTransaction({super.key, required this.type});
  final String? type;

  final int e = 0;

  @override
  ConsumerState createState() => _NewTransactionState(type: type!);
}

class _NewTransactionState extends ConsumerState {
  _NewTransactionState({required this.type});
  late List<List<dynamic>> keys;
  bool isOnFocus = false;
  final String type;
  FocusNode focusNode = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      [
        '.',
        '0',
        const Icon(
          Icons.backspace,
          color: Colors.black,
        )
      ],
    ];
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          isOnFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final overlayVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    ref.watch(noteProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70.h,
            automaticallyImplyLeading: false,
            title: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        context.loc.cancel,
                        style: GoogleFonts.jost(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: kGray[400]),
                      )),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    context.loc.expense,
                    style: GoogleFonts.jost(
                        color: kGray[900],
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            backgroundColor: kGray[50],
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                const AmountWidget(),
                const Spacer(),
                if (isOnFocus) ...[
                  NoteTextField(controller: controller, focusNode: focusNode),
                ] else ...[
                  InkWell(
                      onTap: () => setState(() {
                            isOnFocus = true;
                            focusNode.requestFocus();
                          }),
                      child: const NoteButton()),
                ],
                if (!overlayVisible) const Spacer(),
                Offstage(
                  offstage: overlayVisible,
                  child: const ChooseCategory(),
                ),
                if (!overlayVisible) ...renderKeyboard(),
                if (!overlayVisible)
                  SaveTransactionButton(
                    type: type,
                  )
              ],
            ),
          )),
    );
  }

  Iterable<Row> renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        ref.read(amountProvider.notifier).onBackspacePress();
                      } else {
                        ref.read(amountProvider.notifier).onKeyTap(val);
                      }
                    },
                    onLongPress: (val) {
                      if (val is Widget) {
                        ref.read(amountProvider.notifier).onLongPress();
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }
}
