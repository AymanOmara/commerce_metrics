import 'package:commerce_metrics/core/display/loading_state.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.loadingState,
    required this.successWidget,
  });

  final Widget successWidget;
  final LoadingState loadingState;

  @override
  Widget build(BuildContext context) {
    return switch (loadingState) {
      Loading() => _baseWidget(const CircularProgressIndicator()),
      Idle() => const SizedBox(),
      LoadingSuccess() => _baseWidget(successWidget),
      LoadingException(exception: final exception) =>
        _baseWidget(Text(exception.message)),
    };
  }

  Widget _baseWidget(Widget stateRelatedWidget) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [stateRelatedWidget],
      ),
    );
  }
}
