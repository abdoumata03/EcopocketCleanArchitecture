import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/localization/locale_provider.dart';
import 'package:ecopocket_clean_architecture/localization/supported_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LocaleListTile extends ConsumerWidget {
  const LocaleListTile({
    super.key,
    required this.supportedLocale,
    required this.locale,
  });

  final SupportedLocale supportedLocale;
  final Locale locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
      title: Text(
        supportedLocale.name,
        style: GoogleFonts.jost(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: kGray[900],
        ),
      ),
      trailing: locale.name == supportedLocale.name
          ? Icon(
              Icons.check,
              color: kGray[900],
            )
          : null,
      onTap: () {
        ref
            .read(localeControllerProvider.notifier)
            .changeLanguage(supportedLocale);
      },
    );
  }
}
