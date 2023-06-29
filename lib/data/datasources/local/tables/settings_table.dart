class SettingsTable {
  static const String tableName = "settings";
  static const String columnCurrencyName = "curr_name";
  static const String columnCurrencySymbol = "curr_symbol";
  static const String columnCurrentBalance = "balance";
  static const String columnMonthlyIncome = "monthly_income";
  static const String columnMonthlyBudget = "monthly_budget";
  static const String columnMonthlySavingGoal = "monthly_saving";

  static const createTableQuery = '''
  CREATE TABLE IF NOT EXISTS ${SettingsTable.tableName} (
    ${SettingsTable.columnCurrencyName} TEXT,
    ${SettingsTable.columnCurrencySymbol} TEXT,
    ${SettingsTable.columnCurrentBalance} REAL,
    ${SettingsTable.columnMonthlyIncome} REAL,
    ${SettingsTable.columnMonthlyBudget} REAL,
    ${SettingsTable.columnMonthlySavingGoal} REAL
  )
''';
}
