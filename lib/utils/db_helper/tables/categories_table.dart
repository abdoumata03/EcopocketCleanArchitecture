import 'package:ecopocket_clean_architecture/features/transactions/data/categories_data.dart';
import 'package:sqflite/sqflite.dart';

class CategoryTable {
  static const String tableName = "categories";
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnIcon = 'icon';
  static const String columnColor = 'color';
  static const String columnBudgetType = 'budget_type';
  static const String columnBudgetAmount = 'budget_amount';
  static const String columnBudgetPercentage = 'budget_percentage';

  static const createTableQuery = '''
  CREATE TABLE IF NOT EXISTS ${CategoryTable.tableName} (
    ${CategoryTable.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CategoryTable.columnName} TEXT,
    ${CategoryTable.columnIcon} TEXT,
    ${CategoryTable.columnColor} TEXT,
    ${CategoryTable.columnBudgetType} TEXT,
    ${CategoryTable.columnBudgetAmount} REAL,
    ${CategoryTable.columnBudgetPercentage} REAL
  )
''';

  static void populateCategoriesTable(Database db) async {
    Batch batch = db.batch();

    for (String category in CategoriesData.categoriesList) {
      Map<String, dynamic> categoryDetails =
          CategoriesData.categoriesMap[category]!;

      String name = category;
      String icon = categoryDetails['icon'];
      String color = categoryDetails['color'];

      Map<String, dynamic> categoryData = {
        columnName: name,
        columnIcon: icon,
        columnColor: color,
      };

      batch.insert(tableName, categoryData);
    }

    await batch.commit();
  }
}
