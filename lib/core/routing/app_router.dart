import 'package:commerce_metrics/core/di/injector.dart';
import 'package:commerce_metrics/core/routing/app_routes.dart';
import 'package:commerce_metrics/features/metrics/business_logic/metrics_cubit.dart';
import 'package:commerce_metrics/features/order_line_chart/display/order_chart_display.dart';
import 'package:commerce_metrics/features/order_line_chart/presentation/order_line_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/metrics/presentation/metrics_page.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.metrics:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<MetricsCubit>(),
            child: const MetricsPage(),
          ),
        );
      case AppRoutes.orderLineChart:
        return MaterialPageRoute(
          builder: (_) => OrderLineChartPage(
            chartDisplay: settings.arguments as OrderChartDisplay,
          ),
        );
    }
    return null;
  }
}
