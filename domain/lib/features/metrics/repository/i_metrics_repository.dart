import 'package:domain/common/exception/commerce_exception.dart';

import '../../../common/result.dart';
import '../entity/metrics_entity.dart';

abstract interface class IMetricsRepository {
  Future<Result<List<MetricsEntity>, CommerceException>> getMetrics();
}
