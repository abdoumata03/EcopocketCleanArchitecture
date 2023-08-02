import 'package:ecopocket_clean_architecture/features/budget/data/datasource/budget_database.dart';
import 'package:ecopocket_clean_architecture/features/budget/data/entity/category_entity.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/categories_table.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/transactions_table.dart';
import 'package:sqflite/sqflite.dart';

class BudgetDatabaseImplementation implements BudgetDatabase {
  final Database database;
  BudgetDatabaseImplementation(this.database);

  @override
  Future<void> updateBudget(CategoryEntity categoryEntity) async {
    final int id = categoryEntity['id'];
    await database.update(CategoryTable.tableName, categoryEntity,
        where: '${CategoryTable.columnId} = ?', whereArgs: [id]);
  }

  @override
  Future categorySpending(int categoryId, DateRange dateRange) async {
    final query = await database.query(TransactionTable.tableName,
        columns: ['SUM(${TransactionTable.columnAmount}) AS total'],
        where:
            '${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ? AND ${TransactionTable.columnCategoryId} = ?',
        whereArgs: [dateRange.startDate, dateRange.endDate, categoryId]);

    return query;
  }

  // @override
  // Future<CategoryEntity> getCategory(int categoryId) async {
  //   final query = await database.query(CategoryTable.tableName,
  //       where: '${CategoryTable.columnId} = ?', whereArgs: [categoryId]);

  //   return query;
  // }
}
