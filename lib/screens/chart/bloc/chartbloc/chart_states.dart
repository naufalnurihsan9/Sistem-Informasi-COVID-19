import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/models/chart_models.dart';

class ChartStates extends Equatable {
  const ChartStates();

  @override
  List<Object> get props => [];
}

class ChartInitState extends ChartStates {}

class ChartLoadingState extends ChartStates {}

class ChartLoadedState extends ChartStates {
  final List<ChartModel> chartList;
  ChartLoadedState({@required this.chartList});
}

class ChartErrorState extends ChartStates {
  final String errorMessage;
  ChartErrorState({@required this.errorMessage});
}
