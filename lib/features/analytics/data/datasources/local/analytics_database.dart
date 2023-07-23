import 'package:ecopocket_clean_architecture/features/analytics/data/entity/barchartdata_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/data/entity/category_info_entity.dart';
import 'package:ecopocket_clean_architecture/utils/date_utils/date_range_model.dart';

abstract class AnalyticsDatabase {
  Future<CategoryInfoListEntity> getCategoryStats(DateRange dateRange);
  Future<BarChartDataMapList> getWeeklyBarChartDataMap(DateRange dateRange);
  Future<BarChartDataMapList> getMonthlyBarChartDataMap(DateRange dateRange);
}
