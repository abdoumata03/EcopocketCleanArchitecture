// ignore_for_file: unnecessary_null_comparison, unrelated_type_equality_checks

import 'package:ecopocket_clean_architecture/localization/supported_locale.dart';
import 'package:ecopocket_clean_architecture/utils/shared_preferences/providers.dart';
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
      ref.watch(appSharedPreferenceProvider).saveLocale(locale);
      state = Locale(locale.code);
    } catch (error) {
      state = const Locale('en');
    }
  }

  Locale onAppStart() {
    try {
      final locale = ref.watch(appSharedPreferenceProvider).getLocale() ??
          const Locale('en');
      return locale;
    } catch (error) {
      return const Locale('en');
    }
  }
}
