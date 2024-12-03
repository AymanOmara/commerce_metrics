import 'package:commerce_metrics/core/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class CommerceContainer extends StatelessWidget {
  const CommerceContainer({
    super.key,
    required this.child,
  });

  final Widget child;

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
      child: child,
    );
  }
}
