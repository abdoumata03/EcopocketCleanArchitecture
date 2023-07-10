import 'package:ecopocket_clean_architecture/constants/colors.dart';

class CategoriesData {
  static final List<String> categoriesList = [
    food,
    education,
    transportation,
    supplies,
    healthcare,
    personal
  ];

  static String food = 'Food & Drinks';
  static String transportation = 'Transportation';
  static String supplies = 'Supplies';
  static String healthcare = 'Healthcare';
  static String personal = 'Personal';
  static String education = 'Education';
  static String income = "Income";

  static String foodIcon = 'assets/icons/food.svg';
  static String transportationIcon = 'assets/icons/transportation.svg';
  static String suppliesIcon = 'assets/icons/supplies.svg';
  static String healthcareIcon = 'assets/icons/healthcare.svg';
  static String personalIcon = 'assets/icons/personal.svg';
  static String educationIcon = 'assets/icons/education.svg';
  static String incomeIcon = 'assets/icons/income.svg';

  static const foodColor = '0xFFFF7801';
  static const transportationColor = '0xFFFF555D';
  static const suppliesColor = '0xFF13C38B';
  static const healthcareColor = '0xFF3466FB';
  static const personalColor = '0xFF894EFF';
  static const educationColor = '0xFF2BBEF9';
  static final incomeColor = kGray[400];

  static final Map<String, Map<String, dynamic>> categoriesMap = {
    food: {
      'icon': foodIcon,
      'color': foodColor,
    },
    transportation: {
      'icon': transportationIcon,
      'color': transportationColor,
    },
    supplies: {
      'icon': suppliesIcon,
      'color': suppliesColor,
    },
    healthcare: {
      'icon': healthcareIcon,
      'color': healthcareColor,
    },
    personal: {
      'icon': personalIcon,
      'color': personalColor,
    },
    education: {
      'icon': educationIcon,
      'color': educationColor,
    },
  };
}
