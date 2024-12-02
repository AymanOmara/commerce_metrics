import 'order_status.dart';

class MetricsEntity {
  final OrderStatus orderStatus;
  final String id;
  final bool isActive;
  final String price;
  final String company;
  final String picture;
  final String buyer;
  final DateTime registered;
  final List<String> tags;

  const MetricsEntity({
    required this.id,
    required this.orderStatus,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.registered,
  });
}
