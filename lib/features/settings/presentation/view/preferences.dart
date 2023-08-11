import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/decimal_places_list_tile.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/month_start_list_tile.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/settings_groupe.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/week_start_list_tile.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:ecopocket_clean_architecture/localization/string_hardcoded.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Preferences extends StatelessWidget {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text(
              context.loc.preferences,
              style: GoogleFonts.jost(
                color: kGray[900],
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              SettingsGroupe(
                title: "Calendar".hardcoded,
                children: const [
                  WeekStartListTile(),
                  MonthStartListTile(),
                ],
              ),
              SettingsGroupe(
                title: "Amounts".hardcoded,
                children: const [
                  DecimalPlacesListTile(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
