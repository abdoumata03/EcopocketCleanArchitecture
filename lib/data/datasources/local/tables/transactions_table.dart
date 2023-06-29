import 'package:ecopocket_clean_architecture/data/datasources/local/tables/categories_table.dart';

class TransactionTable {
  static const String tableName = 'transactions';
  static const String columnId = 'id';
  static const String columnAmount = 'amount';
  static const String columnType = 'type';
  static const String columnCategoryId = 'category';
  static const String columnWallet = 'wallet';
  static const String columnDescription = 'description';
  static const String columnTime = 'time';

  static const createTableQuery = '''
      CREATE TABLE IF NOT EXISTS $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnAmount FLAOT,
        $columnType TEXT NOT NULL,
        $columnCategoryId INTEGER,
        $columnWallet TEXT, 
        $columnDescription TEXT,
        $columnTime TEXT
        FOREIGN KEY ($columnCategoryId) REFERENCES ${CategoryTable.tableName}(${CategoryTable.columnId})
      )
    ''';
}
