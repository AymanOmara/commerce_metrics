import 'package:commerce_metrics/core/display/loading_state.dart';
import 'package:commerce_metrics/features/metrics/business_logic/metrics_state.dart';
import 'package:domain/features/metrics/entity/metrics_entity.dart';
import 'package:domain/features/metrics/use_case/get_metrics_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class MetricsCubit extends Cubit<MetricsState> {
  MetricsCubit(this._getMetricsUseCase) : super(MetricsInitialState()) {
    fetchData();
  }

  String presentedName = "";
  final String _fullName = "Ayman Omara";
  LoadingState metricsLoading = Idle();
  final GetMetricsUseCase _getMetricsUseCase;
  List<MetricsEntity> metrics = [];

  void fetchData() {
    metricsLoading = Loading();
    emit(MetricsLoadingChangedState());
    _getMetricsUseCase().then((value){
      value.fold(onSuccess: (data) {
        // this is to simulate loading behaviour
        Future.delayed(const Duration(seconds: 1), () {
          metrics = data;
          metricsLoading = LoadingSuccess();
          emit(MetricsLoadingChangedState());
          myNameDrawer();
        });
      }, onFailure: (exception) {
        metricsLoading = LoadingException(exception);
        emit(MetricsLoadingChangedState());
      });
    });
  }

  void myNameDrawer() {
    int lastSelectedCharIndex = 0;
    Timer.periodic(const Duration(seconds: 1), (_) {
      if (lastSelectedCharIndex < _fullName.length) {
        presentedName += _fullName[lastSelectedCharIndex];
        lastSelectedCharIndex += 1;
      } else {
        presentedName = "";
        lastSelectedCharIndex = 0;
      }
      emit(MetricsPresentedNameChangedState());
    });
  }
}
