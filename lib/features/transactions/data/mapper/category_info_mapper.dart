import 'package:ecopocket_clean_architecture/features/transactions/data/entity/category_info_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info.dart';

class CategoryInfoMapper {
  static CategoryInfo toModel(final CategoryInfoEntity map) {
    return CategoryInfo(
      id: map['id'],
      name: map['name'],
      count: map['count'],
      total: map['total'].toDouble(),
      budget: map['budget'],
      color: map['color'],
      icon: map['icon'],
    );
  }

  static Map<String, dynamic> toMap(final CategoryInfo categoryInfo) {
    return <String, dynamic>{
      'id': categoryInfo.id,
      'name': categoryInfo.name,
      'count': categoryInfo.count,
      'total': categoryInfo.total,
      'budget': categoryInfo.budget,
      'color': categoryInfo.color,
      'icon': categoryInfo.icon,
    };
  }
}
