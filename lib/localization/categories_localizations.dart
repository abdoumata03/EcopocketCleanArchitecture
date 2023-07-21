import 'package:ecopocket_clean_architecture/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';

class CategoriesLocalizations {
  static String getCategoryName(BuildContext context, String categoryKey) {
    final map = {
      'Food & Drinks': context.loc.categoryFood,
      'Education': context.loc.categoryEducation,
      'Transportation': context.loc.categoryTransportation,
      'Supplies': context.loc.categorySupplies,
      'Healthcare': context.loc.categoryHealthcare,
      'Personal': context.loc.categoryPersonal,
      'Income': context.loc.categoryIncome,
    };
    return map[categoryKey]!;
  }
}
