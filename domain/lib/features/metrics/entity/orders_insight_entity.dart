import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/entity/order_status.dart';

class OrderInsightEntity {
  final List<MetricsEntity> _metrics;

  const OrderInsightEntity(
    this._metrics,
  );

  int get orderCount => _metrics.length;

  double averagePrice() {
    var prices = _metrics
        .map((e) =>
            double.tryParse(e.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0)
        .toList();
    if (prices.isEmpty) return 0;
    var total = prices.reduce((sum, price) => sum + price);
    var stringFixed = (total / prices.length).toStringAsFixed(2);
    return double.parse(stringFixed);
  }

  int get numberOfReturn => _metrics
      .where((met) => met.orderStatus == OrderStatus.returned)
      .toList()
      .length;

  int differentBuyerCount() {
    Set<String> buyers = _metrics.map((e) => e.buyer).toSet();
    return buyers.length;
  }
}
