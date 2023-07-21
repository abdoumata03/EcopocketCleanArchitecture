import 'package:ecopocket_clean_architecture/features/analytics/data/module.dart';
import 'package:ecopocket_clean_architecture/features/analytics/data/repository/analytics_repository_impl.dart';
import 'package:ecopocket_clean_architecture/features/analytics/domain/repository/analytics_respository.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'module.g.dart';

@Riverpod(keepAlive: true)
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
  final database = ref.watch(analyticsDatabaseProvider);
  return AnalyticsRepositoryImplementation(database);
}

@riverpod
Future<CategoryInfoList> categoryStats(
    CategoryStatsRef ref, DateRange dateRange) async {
  final repository = ref.watch(analyticsRepositoryProvider);
  return repository.getCategoryStats(dateRange);
}
