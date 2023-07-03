class CategoryTable {
  static const String tableName = "categories";
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnBudgetType = 'budget_type';
  static const String columnBudgetAmount = 'budget_amount';
  static const String columnBudgetPercentage = 'budget_percentage';

  static const createTableQuery = '''
  CREATE TABLE IF NOT EXISTS ${CategoryTable.tableName} (
    ${CategoryTable.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${CategoryTable.columnName} TEXT,
    ${CategoryTable.columnBudgetType} TEXT,
    ${CategoryTable.columnBudgetAmount} REAL,
    ${CategoryTable.columnBudgetPercentage} REAL
  )
''';
}
