import 'package:data/features/metrics/mappers/metrics_mapper.dart';
import 'package:data/features/metrics/models/metrics_model.dart';
import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/entity/order_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test metrics mapper", () {
    test("handle happy scenario no null data", () {
      var metricsModel = MetricsModel(
        id: "123",
        orderStatus: "DELIVERED",
        isActive: true,
        price: "\$100.00",
        company: "ABC Corp",
        picture: "http://example.com/pic.png",
        buyer: "John Doe",
        tags: ["tag1", "tag2"],
        registered: "2021-01-01T00:00:00",
      );
      final entity = metricsModel.toEntity();
      expect(entity, isA<MetricsEntity>());
      expect(entity.id, equals("123"));
      expect(entity.orderStatus, equals(OrderStatus.fromStatusName("DELIVERED")));
      expect(entity.isActive, equals(true));
      expect(entity.price, equals("\$100.00"));
      expect(entity.company, equals("ABC Corp"));
      expect(entity.picture, equals("http://example.com/pic.png"));
      expect(entity.buyer, equals("John Doe"));
      expect(entity.tags, equals(["tag1", "tag2"]));
      expect(entity.registered, equals("2021-01-01T00:00:00"));
    });
    test("should handle null values and return default values", () {
      var metricsModel = MetricsModel(
        id: null,
        orderStatus: null,
        isActive: null,
        price: null,
        company: null,
        picture: null,
        buyer: null,
        tags: null,
        registered: null,
      );
      final entity = metricsModel.toEntity();
      expect(entity, isA<MetricsEntity>());
      expect(entity.id, equals(""));
      expect(entity.orderStatus, equals(OrderStatus.unDefined));
      expect(entity.isActive, equals(false));
      expect(entity.price, equals(""));
      expect(entity.company, equals(""));
      expect(entity.picture, equals(""));
      expect(entity.buyer, equals(""));
      expect(entity.tags, equals([]));
      expect(entity.registered, equals(""));
    });
  });
}
