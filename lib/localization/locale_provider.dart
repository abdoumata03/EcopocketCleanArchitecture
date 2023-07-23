import 'package:ecopocket_clean_architecture/localization/supported_locale.dart';
import 'package:ecopocket_clean_architecture/utils/app_shared_preferences.dart';
import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleController extends _$LocaleController {
  @override
  Locale build() {
    return onAppStart();
  }

  void changeLanguage(SupportedLocale locale) {
    try {
      AppSharedPreference.saveLocale(locale);
      state = Locale(locale.code);
    } catch (error) {
      state = const Locale('en');
    }
  }

  Locale onAppStart() {
    try {
      final locale = AppSharedPreference.getLocale();
      return locale;
    } catch (error) {
      return const Locale('en');
    }
  }
}
