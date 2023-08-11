import 'package:ecopocket_clean_architecture/constants/colors.dart';
import 'package:ecopocket_clean_architecture/features/transactions/presentation/view/widgets/locale_list_tile.dart';
import 'package:ecopocket_clean_architecture/localization/supported_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSection extends StatefulWidget {
  const LanguageSection({
    super.key,
    required this.locale,
  });

  final Locale locale;

  @override
  State<LanguageSection> createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: kGray[300]!,
            width: 1.w,
          ),
          top: BorderSide(
            color: kGray[300]!,
            width: 1.w,
          ),
        ),
      ),
      child: buildLanguageExpansionTile(widget.locale),
    );
  }

  ExpansionPanelList buildLanguageExpansionTile(Locale locale) {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded = !isExpanded;
        });
      },
      expandedHeaderPadding: EdgeInsets.symmetric(vertical: 8.h),
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Colors.transparent,
          headerBuilder: (context, isOpen) {
            return ListTile(
              leading: SvgPicture.asset('assets/icons/language.svg'),
              title: Text(
                locale.name,
                style: GoogleFonts.jost(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: kGray[900],
                ),
              ),
            );
          },
          isExpanded: _isExpanded,
          body: Column(children: [
            LocaleListTile(supportedLocale: SupportedLocale.en, locale: locale),
            LocaleListTile(supportedLocale: SupportedLocale.fr, locale: locale),
          ]),
        )
      ],
    );
  }
}
