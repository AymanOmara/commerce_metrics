import 'package:domain/common/exception/commerce_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/repository/i_metrics_repository.dart';

class GetMetricsUseCase {
  final IMetricsRepository _repository;

  const GetMetricsUseCase(this._repository);

  Future<Result<List<MetricsEntity>, CommerceException>> call() async {
    return await _repository.getMetrics();
  }
}
