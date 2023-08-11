// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:app_settings/app_settings.dart';
import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/setting_list_tile.dart';
import 'package:ecopocket_clean_architecture/features/settings/presentation/view/widgets/settings_groupe.dart';
import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  icon: FluentIcons.money_settings_24_regular,
                  title: context.loc.preferences,
                  onTap: () => context.push('/preferences'),
                ),
              ],
            ),
            SettingsGroupe(children: [
              SettingsListTile(
                icon: FluentIcons.grid_24_regular,
                title: context.loc.categories,
                onTap: () => showSnackbar(
                  context: context,
                  message: context.loc.featureAvailableSoon,
                  emoji: '⏳',
                ),
              ),
              SettingsListTile(
                icon: FluentIcons.wallet_credit_card_24_regular,
                title: context.loc.wallets,
                onTap: () => showSnackbar(
                  context: context,
                  message: context.loc.featureAvailableSoon,
                  emoji: '⏳',
                ),
              ),
            ]),
            SettingsGroupe(children: [
              SettingsListTile(
                icon: FluentIcons.alert_urgent_24_regular,
                title: context.loc.notifications,
                onTap: () => AppSettings.openAppSettings(
                  type: AppSettingsType.notification,
                ),
              ),
            ]),
            SettingsGroupe(children: [
              SettingsListTile(
                icon: FluentIcons.cloud_sync_24_regular,
                title: context.loc.dataBackup,
                onTap: () => showSnackbar(
                  context: context,
                  message: context.loc.featureAvailableSoon,
                  emoji: '⏳',
                ),
              ),
            ]),
            SettingsGroupe(children: [
              SettingsListTile(
                icon: FluentIcons.share_android_24_regular,
                title: context.loc.shareApp,
                isNewPage: false,
                onTap: () async {
                  final result =
                      await Share.shareWithResult('Try out my app Ecopocket!');
                  if (result.status == ShareResultStatus.success) {
                    showSnackbar(
                      context: context,
                      message: context.loc.thanksForSharing,
                      emoji: '🥳',
                    );
                  }
                },
              ),
              SettingsListTile(
                icon: FluentIcons.chat_sparkle_24_regular,
                title: context.loc.feedback,
                isNewPage: false,
                onTap: () async {
                  String email = Uri.encodeComponent("a.matallah@esi-sba.dz");
                  String subject = Uri.encodeComponent("Ecopocket Feedback");
                  Uri mail = Uri.parse("mailto:$email?subject=$subject");
                  await launchUrl(mail);
                },
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
      {required BuildContext context, required String message, String? emoji}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            if (emoji != null)
              Container(
                margin: EdgeInsets.only(right: 10.w),
                child: Text(emoji),
              ),
            Text(
              message,
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
