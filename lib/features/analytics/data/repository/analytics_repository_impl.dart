import 'package:ecopocket_clean_architecture/features/analytics/data/datasources/local/analytics_database.dart';
import 'package:ecopocket_clean_architecture/features/analytics/data/entity/barchartdata_entity.dart';
import 'package:ecopocket_clean_architecture/features/analytics/domain/repository/analytics_respository.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/mapper/category_info_list_mapper.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_model.dart';

class AnalyticsRepositoryImplementation implements AnalyticsRepository {
  final AnalyticsDatabase _analyticsDatabase;
  AnalyticsRepositoryImplementation(this._analyticsDatabase);

  @override
  Future<CategoryInfoList> getCategoryStats(DateRange dateRange) async {
    final entity = await _analyticsDatabase.getCategoryStats(dateRange);
    return CategoryInfoListMapper.toModel(entity);
  }

  @override
  Future<BarChartDataMapList> getWeeklyBarChartDataMap(
      DateRange dateRange) async {
    final entity = await _analyticsDatabase.getWeeklyBarChartDataMap(dateRange);
    return entity;
  }

  @override
  Future<BarChartDataMapList> getMonthlyBarChartDataMap(
      DateRange dateRange) async {
    final entity =
        await _analyticsDatabase.getMonthlyBarChartDataMap(dateRange);
    return entity;
  }
}
