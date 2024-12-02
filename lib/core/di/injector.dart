import 'package:commerce_metrics/features/metrics/business_logic/metrics_cubit.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.I;

void registerDependencies(GetIt diInjector) async {
  getIt.registerFactory(() => MetricsCubit(diInjector()));
}
