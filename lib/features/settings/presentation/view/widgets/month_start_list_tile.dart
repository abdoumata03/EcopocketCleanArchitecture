import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/localization/string_hardcoded.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthStartListTile extends ConsumerStatefulWidget {
  const MonthStartListTile({
    super.key,
  });

  @override
  MonthStartListTileState createState() => MonthStartListTileState();
}

class MonthStartListTileState extends ConsumerState<MonthStartListTile> {
  final List<String> items = List.generate(31, (index) => '${index + 1}');
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      titleAlignment: ListTileTitleAlignment.center,
      leading: Icon(
        FluentIcons.calendar_month_24_regular,
        color: kGray[400],
      ),
      horizontalTitleGap: 10.w,
      contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 4.h),
      title: Text(
        'Start of the month'.hardcoded,
        style: GoogleFonts.jost(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
          color: kGray[800],
        ),
      ),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
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
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
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
