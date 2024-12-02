import 'package:data/features/metrics/data_sources/asset_json_data_source.dart';
import 'package:data/features/metrics/repository/metrics_repository.dart';
import 'package:domain/features/metrics/data_sources/json_data_source.dart';
import 'package:domain/features/metrics/repository/i_metrics_repository.dart';
import 'package:get_it/get_it.dart';

void setupRepositoryInjector(GetIt diInjector) {
  /// ********* Metrics **********
  diInjector.registerFactory<JsonDataSource>(() => AssetJsonDataSource());
  diInjector.registerFactory<IMetricsRepository>(() => MetricsRepository(diInjector()));
}
