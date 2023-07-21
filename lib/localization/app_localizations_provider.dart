// ignore_for_file: deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// lookupAppLocalizations is defined here 👇
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;

/// provider used to access the AppLocalizations object for the current locale
final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  // set the initial locale
  ref.state = lookupAppLocalizations(basicLocaleListResolution(
      [ui.window.locale], AppLocalizations.supportedLocales));
  // update afterwards
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(basicLocaleListResolution(
        [ui.window.locale], AppLocalizations.supportedLocales));
  });
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return ref.state;
});

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
