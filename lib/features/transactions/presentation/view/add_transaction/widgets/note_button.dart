// ignore_for_file: deprecated_member_use

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/controller/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteButton extends ConsumerWidget {
  const NoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(noteProvider);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 18.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              note.isEmpty
                  ? 'assets/icons/note.svg'
                  : 'assets/icons/note_edit.svg',
              color: note.isEmpty ? kGray[500] : kGray[900],
            ),
            SizedBox(width: 8.w),
            Text(
              note.isEmpty ? 'Add note' : note,
              style: GoogleFonts.jost(
                  color: note.isEmpty ? kGray[500] : kGray[900],
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}
