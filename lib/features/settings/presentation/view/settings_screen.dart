// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/setting_list_tile.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/settings_groupe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: kGray[900],
              ),
            ),
            const Spacer(),
          ],
        ),
        backgroundColor: kGray[50],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsGroupe(
              children: [
                SettingsListTile(
                  icon: 'assets/icons/preferences.svg',
                  title: 'Preferences',
                  onTap: () => log('Preferences'),
                ),
              ],
            ),
            SettingsGroupe(children: [
              SettingsListTile(
                  icon: 'assets/icons/categories.svg',
                  title: 'Categories',
                  onTap: () => showAvailableSoonSnackbar(context)),
              SettingsListTile(
                icon: 'assets/icons/wallets.svg',
                title: 'Wallets',
                onTap: () => showAvailableSoonSnackbar(context),
              ),
            ]),
            SettingsGroupe(children: [
              SettingsListTile(
                icon: 'assets/icons/notifications.svg',
                title: 'Notifications',
                onTap: () => showAvailableSoonSnackbar(context),
              ),
            ]),
            SettingsGroupe(children: [
              SettingsListTile(
                icon: 'assets/icons/data.svg',
                title: 'Data backup',
                onTap: () => showAvailableSoonSnackbar(context),
              ),
            ]),
            SettingsGroupe(children: [
              SettingsListTile(
                icon: 'assets/icons/share.svg',
                title: 'Share the app',
                isNewPage: false,
                onTap: () => log('Tapped'),
              ),
              SettingsListTile(
                icon: 'assets/icons/feedback.svg',
                title: 'Feedback',
                isNewPage: false,
                onTap: () => log('Tapped'),
              ),
            ]),
            Text(
              'Version 1.0.0',
              style: GoogleFonts.jost(color: kGray[400]),
            )
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showAvailableSoonSnackbar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            const Text("⏳"),
            const SizedBox(width: 10),
            Text(
              'Feature available soon...',
              style: GoogleFonts.jost(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
