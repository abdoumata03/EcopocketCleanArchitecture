import 'dart:async';

import 'package:ecopocket_clean_architecture/utils/db_helper/tables/categories_table.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/settings_table.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/tables/transactions_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? db;

  static Future<Database?> get database async {
    db ??= await _initDatabase();
    return db;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ecopocket.db');

    return await openDatabase(path,
        version: 1, onCreate: _createDB, onConfigure: _onConfigure);
  }

  static FutureOr<void> _createDB(Database db, int version) async {
    await db.execute(TransactionTable.createTableQuery);
    await db.execute(CategoryTable.createTableQuery);
    CategoryTable.populateCategoriesTable(db);
    await db.execute(SettingsTable.createTableQuery);
  }

  static Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
}
