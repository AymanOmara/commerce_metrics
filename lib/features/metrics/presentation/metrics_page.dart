import 'package:commerce_metrics/core/routing/app_routes.dart';
import 'package:commerce_metrics/core/ui/loading/loading_widget.dart';
import 'package:commerce_metrics/features/metrics/business_logic/metrics_cubit.dart';
import 'package:commerce_metrics/features/metrics/business_logic/metrics_state.dart';
import 'package:commerce_metrics/features/metrics/presentation/widgets/order_status_widget.dart';
import 'package:commerce_metrics/features/order_line_chart/display/order_chart_display.dart';
import 'package:domain/features/metrics/entity/orders_insight_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MetricsPage extends StatelessWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsCubit, MetricsState>(
      builder: (context, state) {
        MetricsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
            child: LoadingWidget(
              loadingState: cubit.metricsLoading,
              successWidget: Expanded(
                child: Column(
                  children: [
                    Text(
                      cubit.presentedName,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    OrderStatusWidget(
                      orderInsightEntity: OrderInsightEntity(
                        cubit.metrics,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.orderLineChart,
                          arguments: OrderChartDisplay(cubit.metrics),
                        );
                      },
                      child: const Text("go next"),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
