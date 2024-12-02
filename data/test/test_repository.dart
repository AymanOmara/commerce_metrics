import 'package:data/features/metrics/repository/metrics_repository.dart';
import 'package:domain/common/exception/general_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/metrics/data_sources/json_data_source.dart';
import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/entity/order_status.dart';
import 'package:domain/features/metrics/repository/i_metrics_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/null_data_mock_json_data_source.dart';
import 'helpers/success_mock_json_data_source.dart';
import 'helpers/un_correct_json_data_mock_json_data_source.dart';

void main() {
  group("test repository", () {
    late IMetricsRepository repository;
    late JsonDataSource mockJsonDataSource;
    test('should return success when JSON is valid', () async {
      mockJsonDataSource = SuccessMockJsonDataSource();
      repository = MetricsRepository(mockJsonDataSource);
      final result = await repository.getMetrics();
      switch (result) {
        case Success(data: final data):
          expect(data, isA<List<MetricsEntity>>());
        case Failure(exception: final exception):
      }
    });
    test('should success handle nulls', () async {
      mockJsonDataSource = NullDataMockJsonDataSource();
      repository = MetricsRepository(mockJsonDataSource);
      final result = await repository.getMetrics();
      switch (result) {
        case Success(data: final data):
          expect(data, isA<List<MetricsEntity>>());
          expect(data.first.id, "");
          expect(data.first.orderStatus, OrderStatus.unDefined);
        case Failure(exception: final exception):
      }
    });
    test('should return general error when JSON is not valid', () async {
      mockJsonDataSource = UnCorrectJsonDataMockJson();
      repository = MetricsRepository(mockJsonDataSource);
      final result = await repository.getMetrics();
      switch (result) {
        case Success(data: final data):
          break;
        case Failure(exception: final exception):
          expect(exception, isA<GeneralException>());
      }
    });
  });
}
