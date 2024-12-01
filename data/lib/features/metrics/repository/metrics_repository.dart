import 'dart:convert';

import 'package:data/features/metrics/mappers/metrics_mapper.dart';
import 'package:data/features/metrics/models/metrics_model.dart';
import 'package:domain/common/exception/commerce_exception.dart';
import 'package:domain/common/exception/general_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/repository/i_metrics_repository.dart';
import 'package:flutter/services.dart';

class MetricsRepository implements IMetricsRepository {
  @override
  Future<Result<List<MetricsEntity>, CommerceException>> getMetrics() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/orders.json');
      List<Map<String, dynamic>> data = jsonDecode(jsonString);
      List<MetricsModel> metrics =
          data.map((e) => MetricsModel.fromJson(e)).toList();
      List<MetricsEntity> metricsEntities =
          metrics.map((e) => e.toEntity()).toList();
      return Success(metricsEntities);
    } catch (_) {
      return Failure(GeneralException());
    }
  }
}
