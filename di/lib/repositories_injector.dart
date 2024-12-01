import 'package:data/features/metrics/repository/metrics_repository.dart';
import 'package:domain/features/metrics/repository/i_metrics_repository.dart';
import 'package:get_it/get_it.dart';

void setupRepositoryInjector(GetIt diInjector) {
  /// ********* Metrics **********
  diInjector.registerFactory<IMetricsRepository>(() => MetricsRepository());
}
