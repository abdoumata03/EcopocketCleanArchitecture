import 'dart:async';

import 'package:ecopocket_clean_architecture/data/datasources/local/tables/categories_table.dart';
import 'package:ecopocket_clean_architecture/data/datasources/local/tables/settings_table.dart';
import 'package:ecopocket_clean_architecture/data/datasources/local/tables/transactions_table.dart';
import 'package:ecopocket_clean_architecture/data/datasources/local/transactions_database.dart';
import 'package:ecopocket_clean_architecture/data/entity/transactions_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TransactionsDtabaseImplemention implements TransactionsDatabase {
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDatabase();
    return _database;
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
          where: TransactionTable.columnId, whereArgs: [id]);
      transaction = results.first;
    });
    return transaction;
  }

  @override
  Future<TransactionListEntity> allTransactions() async {
    final db = await database;
    return db!.query(TransactionTable.tableName);
  }

  @override
  Future<void> deleteTransaction(int id) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> updateTransaction(TransactionEntity transactionEntity) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
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
    await db.execute(SettingsTable.createTableQuery);
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}