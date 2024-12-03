import 'package:domain/common/exception/commerce_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/metrics/entity/metrics_entity.dart';

abstract interface class IMetricsRepository {
  Future<Result<List<MetricsEntity>, CommerceException>> getMetrics();
}
