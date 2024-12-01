import 'package:commerce_metrics/core/routing/app_routes.dart';
import 'package:flutter/material.dart';

import '../../features/mertics/presentation/metrics_page.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.metrics:
        return MaterialPageRoute(
          builder: (_) => const MetricsPage(),
        );
    }
  }
}
