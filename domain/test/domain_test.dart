import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/entity/order_status.dart';
import 'package:domain/features/metrics/entity/orders_insight_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test insight calculations", () {
    List<MetricsEntity> metrics = [];
    late OrderInsightEntity orderInsightEntity;
    setUpAll(() {
      metrics = _generateMetrics();
      orderInsightEntity = OrderInsightEntity(metrics);
    });
    test('test average price', () {
      expect(orderInsightEntity.averagePrice(), 642.83);
    });
    test('test average price empty orders', () {
      expect(const OrderInsightEntity([]).averagePrice(), 0);
    });
    test('test number of returns ', () {
      expect(orderInsightEntity.numberOfReturn, 2);
    });
    test("test total order count", () {
      expect(orderInsightEntity.orderCount, 5);
    });
    test("test different buyer count", () {
      expect(orderInsightEntity.differentBuyerCount(), 4);
    });
  });
}

List<MetricsEntity> _generateMetrics() {
  return [
    MetricsEntity(
      id: '078d4d17-f6af-4a4e-b726-27c172bbff7f',
      orderStatus: OrderStatus.delivered,
      isActive: true,
      price: "\$3,164.16",
      company: 'Fox, Dunn and Goodwin',
      picture: 'https://placeimg.com/837/17/any',
      buyer: 'Ayman',
      tags: ['himself', 'suddenly'],
      registered: DateTime.parse('2021-07-28T15:26:50'),
    ),
    MetricsEntity(
      id: '4845dbf4-1746-4edb-8116-616a4382f627',
      orderStatus: OrderStatus.delivered,
      isActive: false,
      price: '\$0',
      company: 'Barber and Sons',
      picture: 'https://placekitten.com/306/849',
      buyer: 'Sayed',
      tags: ['less', 'drive'],
      registered: DateTime.parse('2021-07-28T15:26:50'),
    ),
    MetricsEntity(
      id: 'c94a75d8-3213-47e3-adc7-a61b2d995315',
      orderStatus: OrderStatus.delivered,
      isActive: true,
      price: '\$30',
      company: 'Davis Inc',
      picture: 'https://placekitten.com/712/813',
      buyer: 'Sayed',
      tags: ['east', 'else', 'development', 'test', 'model'],
      registered: DateTime.parse('2021-07-28T15:26:50'),
    ),
    MetricsEntity(
      id: 'ee4794f1-e1b7-415f-aa64-4b25264b633d',
      orderStatus: OrderStatus.returned,
      isActive: false,
      price: '\$10',
      company: 'Griffith-Porter',
      picture: 'https://placekitten.com/703/706',
      buyer: 'Jeffrey Herrera',
      tags: ['society', 'especially', 'interview'],
      registered: DateTime.parse('2021-07-28T15:26:50'),
    ),
    MetricsEntity(
      id: '2a87c3cf-993b-40fb-bce7-151c504c51bf',
      orderStatus: OrderStatus.returned,
      isActive: true,
      price: '\$10',
      company: 'Kelley Ltd',
      picture: 'https://placeimg.com/74/261/any',
      buyer: 'Diana English',
      tags: ['look', 'worry', 'population'],
      registered: DateTime.parse('2021-07-28T15:26:50'),
    ),
  ];
}
