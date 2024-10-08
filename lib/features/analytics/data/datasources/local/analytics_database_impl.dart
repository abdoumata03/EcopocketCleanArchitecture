import 'package:ecopocket_clean_architecture/features/analytics/data/datasources/local/analytics_database.dart';
import 'package:ecopocket_clean_architecture/features/analytics/data/entity/barchartdata_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/category_info_entity.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/categories_table.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/transactions_table.dart';
import 'package:sqflite/sqflite.dart';

class AnalyticsDatabaseImplementation implements AnalyticsDatabase {
  final Database database;
  AnalyticsDatabaseImplementation(this.database);

  @override
  Future<CategoryInfoListEntity> getCategoryStats(DateRange dateRange) async {
    final query = database.rawQuery('''
        SELECT 
          ${CategoryTable.tableName}.${CategoryTable.columnId},
          ${CategoryTable.columnName} AS name,
          SUM(${TransactionTable.columnAmount}) AS total,
          COUNT(*) AS count,
          ${CategoryTable.columnIcon} AS icon,
          ${CategoryTable.columnColor} AS color,
           SUM(${TransactionTable.columnAmount}) * 100.0 / 
       (SELECT SUM(${TransactionTable.columnAmount}) 
         FROM ${TransactionTable.tableName} 
         WHERE ${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ?) AS percentage
        FROM 
        ${TransactionTable.tableName}
        INNER JOIN 
        ${CategoryTable.tableName} 
        ON 
        ${TransactionTable.tableName}.${TransactionTable.columnCategoryId} = 
        ${CategoryTable.tableName}.${CategoryTable.columnId}
        WHERE 
        ${TransactionTable.tableName}.${TransactionTable.columnTime} >= ?
        AND ${TransactionTable.tableName}.${TransactionTable.columnTime} <= ?
        GROUP BY 
        ${TransactionTable.columnCategoryId}
    ''', [
      dateRange.startDate,
      dateRange.endDate,
      dateRange.startDate,
      dateRange.endDate
    ]);

    return query;
  }

  @override
  Future<BarChartDataMapList> getWeeklyBarChartDataMap(
      DateRange dateRange) async {
    final query = database.rawQuery('''
       SELECT strftime('%w', ${TransactionTable.columnTime}) AS day, 
       SUM(amount) AS total_spent
       FROM ${TransactionTable.tableName}
       WHERE ${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ?
       GROUP BY day;
''', [dateRange.startDate, dateRange.endDate]);

    return query;
  }

  @override
  Future<BarChartDataMapList> getMonthlyBarChartDataMap(
      DateRange dateRange) async {
    final query = database.rawQuery('''
       SELECT strftime('%d', ${TransactionTable.columnTime}) AS day, 
       SUM(amount) AS total_spent
       FROM ${TransactionTable.tableName}
       WHERE ${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ?
       GROUP BY day;
''', [dateRange.startDate, dateRange.endDate]);

    return query;
  }
}
