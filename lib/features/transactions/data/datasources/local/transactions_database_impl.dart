// ignore_for_file: unused_import

import 'dart:async';
import 'dart:developer';

import 'package:ecopocket_clean_architecture/features/budget/data/entity/category_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/transactions_database.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/category_info_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/transactions_entity.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/todays_date.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/categories_table.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/transactions_table.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TransactionsDatabaseImplemention implements TransactionsDatabase {
  final Database database;
  TransactionsDatabaseImplemention(this.database);

  @override
  Future<TransactionListEntity> allTransactions() async {
    final query = await database.rawQuery('''
        SELECT 
          ${TransactionTable.tableName}.*,
          ${CategoryTable.tableName}.${CategoryTable.columnName} AS category_name
        FROM 
        ${TransactionTable.tableName}
        INNER JOIN 
        ${CategoryTable.tableName} 
        ON 
        ${TransactionTable.tableName}.${TransactionTable.columnCategoryId} = 
        ${CategoryTable.tableName}.${CategoryTable.columnId}
''');
    return query;
  }

  @override
  Future<TransactionListEntity> getTransactionsByDateRange(
      DateRange dateRange) async {
    final query = await database.rawQuery('''
        SELECT 
          ${TransactionTable.tableName}.*,
          ${CategoryTable.tableName}.${CategoryTable.columnName} AS category_name
        FROM 
        ${TransactionTable.tableName}
        INNER JOIN 
        ${CategoryTable.tableName} 
        ON 
        ${TransactionTable.tableName}.${TransactionTable.columnCategoryId} = 
        ${CategoryTable.tableName}.${CategoryTable.columnId}
        WHERE 
        ${TransactionTable.tableName}.${TransactionTable.columnTime} >= ? AND
        ${TransactionTable.tableName}.${TransactionTable.columnTime} <= ?
''', [
      dateRange.startDate,
      dateRange.endDate,
    ]);
    return query;
  }

  @override
  Future<CategoryListEntity> allCategories() async {
    return database.query(CategoryTable.tableName);
  }

  @override
  Future<TransactionEntity> addTransaction(
      TransactionEntity transactionEntity) async {
    late final TransactionEntity transaction;
    await database.transaction((txn) async {
      final id = await txn.insert(TransactionTable.tableName, transactionEntity,
          conflictAlgorithm: ConflictAlgorithm.replace);
      final results = await txn.query(TransactionTable.tableName,
          where: '${TransactionTable.columnId} = ?', whereArgs: [id]);
      transaction = results.first;
    });
    return transaction;
  }

  @override
  Future<void> updateTransaction(TransactionEntity transactionEntity) async {
    final int id = transactionEntity['id'];
    await database.update(TransactionTable.tableName, transactionEntity,
        where: '${TransactionTable.columnId} = ?', whereArgs: [id]);
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await database.delete(TransactionTable.tableName,
        where: '${TransactionTable.tableName} = ?', whereArgs: [id]);
  }

  @override
  Future<CategoryInfoListEntity> getTodayCategoryInfo() async {
    var query = await database.rawQuery('''
        SELECT 
          ${CategoryTable.tableName}.${CategoryTable.columnId},
          ${CategoryTable.columnName} AS name,
          SUM(${TransactionTable.columnAmount}) AS total,
          COUNT(*) AS count,
          ${CategoryTable.columnIcon} AS icon,
          ${CategoryTable.columnColor} AS color,
          ${TransactionTable.columnTime}
        FROM 
        ${TransactionTable.tableName}
        INNER JOIN 
        ${CategoryTable.tableName} 
        ON 
        ${TransactionTable.tableName}.${TransactionTable.columnCategoryId} = 
        ${CategoryTable.tableName}.${CategoryTable.columnId}
        WHERE 
        ${TransactionTable.tableName}.${TransactionTable.columnTime} >= ?
        GROUP BY 
        ${TransactionTable.columnCategoryId}
    ''', ["${getTodaysDate()}T00:00:00.000000"]);

    return query;
  }

  @override
  Future<CategoryInfoListEntity> getYstdCategoryInfo() async {
    var query = await database.rawQuery('''
        SELECT 
          ${CategoryTable.tableName}.${CategoryTable.columnId},
          ${CategoryTable.columnName} AS name,
          SUM(${TransactionTable.columnAmount}) AS total,
          COUNT(*) AS count,
          ${CategoryTable.columnIcon} AS icon,
          ${CategoryTable.columnColor} AS color,
          ${TransactionTable.columnTime}
        FROM 
        ${TransactionTable.tableName}
        INNER JOIN 
        ${CategoryTable.tableName} 
        ON 
        ${TransactionTable.tableName}.${TransactionTable.columnCategoryId} = 
        ${CategoryTable.tableName}.${CategoryTable.columnId}
        WHERE 
        ${TransactionTable.tableName}.${TransactionTable.columnTime} >= ? AND
        ${TransactionTable.tableName}.${TransactionTable.columnTime} <= ?
        GROUP BY 
        ${TransactionTable.columnCategoryId}
    ''', [
      "${getYesterdaysDate()}T00:00:00.000000",
      "${getTodaysDate()}T00:00:00.000000"
    ]);

    return query;
  }

  @override
  Future<dynamic> getSpendings(DateRange dateRange) async {
    final query = database.query(TransactionTable.tableName,
        columns: ['SUM(${TransactionTable.columnAmount}) AS total'],
        where:
            '${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ?',
        whereArgs: [dateRange.startDate, dateRange.endDate]);

    return query;
  }

  @override
  Future<TransactionListEntity> getCategoryTransactions(
      DateRange dateRange, int categoryId) async {
    final query = database.query(TransactionTable.tableName,
        columns: ['*'],
        where:
            '${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ? AND ${TransactionTable.columnCategoryId} = ?',
        whereArgs: [dateRange.startDate, dateRange.endDate, categoryId]);

    return query;
  }
}
