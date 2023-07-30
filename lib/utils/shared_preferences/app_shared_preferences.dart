// ignore_for_file: constant_identifier_names

import 'dart:ui';
import 'package:ecopocket_clean_architecture/localization/supported_locale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  AppSharedPreference(this.sharedPreference);
  final SharedPreferences sharedPreference;

  static const _LOCALE_KEY = 'locale';
  static const _MONTHLY_BUDGET_KEY = 'monthlyBudget';

  void saveLocale(SupportedLocale locale) {
    sharedPreference.setString(_LOCALE_KEY, locale.code);
  }

  Locale? getLocale() {
    final bool isLocaleSet = sharedPreference.containsKey(_LOCALE_KEY);
    if (!isLocaleSet) return null;
    final String localeCode = sharedPreference.get(_LOCALE_KEY).toString();
    if (localeCode.isEmpty) throw 'Locale not found';
    return Locale(localeCode);
  }

  void setMonthlyBudget(double budget) {
    sharedPreference.setDouble(_MONTHLY_BUDGET_KEY, budget);
  }

  double? getMonthlyBudget() {
    final bool isBudgetSet = sharedPreference.containsKey(_MONTHLY_BUDGET_KEY);
    if (!isBudgetSet) return null;
    final double budget = sharedPreference.getDouble(_MONTHLY_BUDGET_KEY)!;
    if (budget == 0) throw 'Budget not found';
    return budget;
  }

  void deleteMonthlyBudget() {
    sharedPreference.remove(_MONTHLY_BUDGET_KEY);
  }
}
