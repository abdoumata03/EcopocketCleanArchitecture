import 'dart:async';
import 'dart:developer';

import 'package:ecopocket_clean_architecture/features/budget/data/entity/category_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/tables/categories_table.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/tables/settings_table.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/tables/transactions_table.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/datasources/local/transactions_database.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/category_info_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/transactions_entity.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_model.dart';
import 'package:ecopocket_clean_architecture/utils/todays_date.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TransactionsDatabaseImplemention implements TransactionsDatabase {
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDatabase();
    return _database;
  }

  @override
  Future<TransactionListEntity> allTransactions() async {
    final db = await database;
    return db!.query(TransactionTable.tableName);
  }

  @override
  Future<CategoryListEntity> allCategories() async {
    final db = await database;
    return db!.query(CategoryTable.tableName);
  }

  @override
  Future<TransactionEntity> addTransaction(
      TransactionEntity transactionEntity) async {
    final db = await database;
    late final TransactionEntity transaction;
    await db!.transaction((txn) async {
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
    final db = await database;
    final int id = transactionEntity['id'];
    await db!.update(TransactionTable.tableName, transactionEntity,
        where: '${TransactionTable.columnId} = ?', whereArgs: [id]);
  }

  @override
  Future<void> deleteTransaction(int id) async {
    final db = await database;
    await db!.delete(TransactionTable.tableName,
        where: '${TransactionTable.tableName} = ?', whereArgs: [id]);
  }

  @override
  Future<CategoryInfoListEntity> getTodayCategoryInfo() async {
    final db = await database;

    var query = await db!.rawQuery('''
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
    final db = await database;

    var query = await db!.rawQuery('''
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
    final db = await database;
    final query = db!.query(TransactionTable.tableName,
        columns: ['SUM(${TransactionTable.columnAmount}) AS total'],
        where:
            '${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ?',
        whereArgs: [dateRange.startDate, dateRange.endDate]);

    return query;
  }

  @override
  Future<TransactionListEntity> getCategoryTransactions(
      DateRange dateRange, int categoryId) async {
    final db = await database;

    final query = db!.query(TransactionTable.tableName,
        columns: ['*'],
        where:
            '${TransactionTable.columnTime} >= ? AND ${TransactionTable.columnTime} <= ? AND ${TransactionTable.columnCategoryId} = ?',
        whereArgs: [dateRange.startDate, dateRange.endDate, categoryId]);

    return query;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ecopocket.db');

    return await openDatabase(path,
        version: 1, onCreate: _createDB, onConfigure: _onConfigure);
  }

  FutureOr<void> _createDB(Database db, int version) async {
    await db.execute(TransactionTable.createTableQuery);
    await db.execute(CategoryTable.createTableQuery);
    CategoryTable.populateCategoriesTable(db);
    await db.execute(SettingsTable.createTableQuery);
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
