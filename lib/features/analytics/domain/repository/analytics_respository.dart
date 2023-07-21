import 'package:ecopocket_clean_architecture/features/analytics/data/entity/barchartdata_entity.dart';
import 'package:ecopocket_clean_architecture/features/transactions/domain/model/category_info_list.dart';
import 'package:ecopocket_clean_architecture/utils/date_range_model.dart';

abstract class AnalyticsRepository {
  Future<CategoryInfoList> getCategoryStats(DateRange dateRange);
  Future<BarChartDataMapList> getWeeklyBarChartDataMap(DateRange dateRange);
  Future<BarChartDataMapList> getMonthlyBarChartDataMap(DateRange dateRange);
}
