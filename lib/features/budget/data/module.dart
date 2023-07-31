import 'package:ecopocket_clean_architecture/features/budget/data/datasource/budget_database.dart';
import 'package:ecopocket_clean_architecture/features/budget/data/datasource/budget_database_impl.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@Riverpod(keepAlive: true)
BudgetDatabase budgetDatabase(BudgetDatabaseRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return BudgetDatabaseImplementation(database);
}
