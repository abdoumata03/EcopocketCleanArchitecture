import 'package:ecopocket_clean_architecture/features/budget/domain/model/category.dart';

class CategoryMapper {
  CategoryMapper._();

  static Category toModel(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      icon: map['icon'],
      budgetType: map['budget_type'],
      budgetAmount: map['budget_amount'],
      budgetPercentage: map['budget_percentage'],
    );
  }

  static Map<String, dynamic> toMap(Category category) {
    return {
      'id': category.id,
      'name': category.name,
      'color': category.color,
      'icon': category.icon,
      'budget_type': category.budgetType,
      'budget_amount': category.budgetAmount,
      'budget_percentage': category.budgetPercentage,
    };
  }
}
