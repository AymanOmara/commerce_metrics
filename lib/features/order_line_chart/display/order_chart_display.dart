import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:fl_chart/fl_chart.dart';

class OrderChartDisplay {
  final List<MetricsEntity> _metrics;

  const OrderChartDisplay(this._metrics);

  Map<String, int> orderCountMap() {
    Map<String, int> map = {};
    final sortedMetrics = List<MetricsEntity>.from(_metrics)
      ..sort((a, b) => a.registered.compareTo(b.registered));
    for (var metric in sortedMetrics) {
      String yearMonth =
          '${metric.registered.year}-${metric.registered.month.toString().padLeft(2, '0')}';
      map[yearMonth] = (map[yearMonth] ?? 0) + 1;
    }
    return map;
  }

  List<FlSpot> generateGraphData() {
    return orderCountMap()
        .values
        .toList()
        .asMap()
        .entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value.toDouble()))
        .toList();
  }
}
