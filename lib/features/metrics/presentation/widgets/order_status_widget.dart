import 'package:commerce_metrics/core/ui/theme/colors.dart';
import 'package:domain/features/metrics/entity/orders_insight_entity.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
    required this.orderInsightEntity,
  });

  final OrderInsightEntity orderInsightEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(color: mutedGray, blurRadius: 6),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Gif(
                autostart: Autostart.loop,
                image: const AssetImage('assets/total_orders.gif'),
                width: 50,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Total Orders:"),
              Text("${orderInsightEntity.differentBuyerCount()}")
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Gif(
                autostart: Autostart.loop,
                image: const AssetImage('assets/returned_orders.gif'),
                width: 50,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Total Returned:"),
              Text("${orderInsightEntity.numberOfReturn}")
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Gif(
                autostart: Autostart.loop,
                image: const AssetImage('assets/money-bag.gif'),
                width: 50,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Average Price:"),
              Text("${orderInsightEntity.averagePrice()}")
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Gif(
                autostart: Autostart.loop,
                image: const AssetImage('assets/user.gif'),
                width: 50,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Different Users:"),
              Text("${orderInsightEntity.differentBuyerCount()}")
            ],
          ),
        ],
      ),
    );
  }
}
