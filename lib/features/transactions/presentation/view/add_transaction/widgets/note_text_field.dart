import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/constants/styles.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteTextField extends ConsumerWidget {
  const NoteTextField({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(boxShadow: [defaultBoxShadow]),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: kBlue,
        style: GoogleFonts.jost(
            color: kGray[700], fontSize: 18.sp, fontWeight: FontWeight.w500),
        onChanged: (value) {
          ref.read(noteProvider.notifier).setNote(value);
        },
        decoration: InputDecoration(
          hintText: 'Add a note',
          hintStyle: GoogleFonts.jost(
              color: kGray[400], fontSize: 18.sp, fontWeight: FontWeight.w500),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGray[300]!),
            borderRadius: BorderRadius.zero,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
        ),
      ),
    );
  }
}
