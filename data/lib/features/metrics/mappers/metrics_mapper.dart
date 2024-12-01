import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/entity/order_status.dart';

import '../models/metrics_model.dart';

extension MetricsMapper on MetricsModel? {
  MetricsEntity toEntity() => MetricsEntity(
        id: this?.id ?? "",
        orderStatus: OrderStatus.fromStatusName(this?.orderStatus ?? ""),
        isActive: this?.isActive ?? false,
        price: this?.price ?? "",
        company: this?.company ?? "",
        picture: this?.picture ?? "",
        buyer: this?.buyer ?? "",
        tags: this?.tags ?? [],
        registered: this?.registered ?? "",
      );
}
