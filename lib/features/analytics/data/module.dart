import 'package:ecopocket_clean_architecture/features/analytics/data/datasources/local/analytics_database.dart';
import 'package:ecopocket_clean_architecture/features/analytics/data/datasources/local/analytics_database_impl.dart';
import 'package:ecopocket_clean_architecture/utils/db_helper/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@Riverpod(keepAlive: true)
AnalyticsDatabase analyticsDatabase(AnalyticsDatabaseRef ref) {
  final database = ref.watch(appDatabaseProvider);
  return AnalyticsDatabaseImplementation(database);
}
