import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/localization/string_hardcoded.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DecimalPlacesListTile extends ConsumerStatefulWidget {
  const DecimalPlacesListTile({
    super.key,
  });

  @override
  DecimalPlacesListTileState createState() => DecimalPlacesListTileState();
}

class DecimalPlacesListTileState extends ConsumerState<DecimalPlacesListTile> {
  final List<int> items = [0, 1, 2, 3];

  int? selectedValue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(
        FluentIcons.decimal_arrow_right_24_regular,
        color: kGray[400],
      ),
      horizontalTitleGap: 10.w,
      contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
      title: Text(
        'Decimal places'.hardcoded,
        style: GoogleFonts.jost(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: kGray[800],
        ),
      ),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton2<int>(
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          style: GoogleFonts.jost(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: kGray[500],
          ),
          items: items
              .map((int item) => DropdownMenuItem<int>(
                    value: item,
                    child: Text(
                      item.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: kGray[500]!,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (int? value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
      onTap: null,
    );
  }
}
