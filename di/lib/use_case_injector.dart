import 'package:domain/features/metrics/use_case/get_metrics_use_case.dart';
import 'package:get_it/get_it.dart';

void setupUseCaseInjector(GetIt diInjector) {
  /// ********* Metrics **********
  diInjector.registerFactory(()=> GetMetricsUseCase(diInjector()));
}
