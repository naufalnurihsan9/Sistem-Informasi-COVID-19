import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/bloc/chartbloc/chart_events.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/bloc/chartbloc/chart_states.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/models/chart_models.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/repositories/chart_repositories.dart';

class ChartBloc extends Bloc<ChartEvents, ChartStates> {
  ChartRepository chartRepositoty;
  ChartBloc(
      {@required ChartStates initialState, @required this.chartRepositoty})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<ChartStates> mapEventToState(ChartEvents event) async* {
    if (event is StartEvent) {
      try {
        List<ChartModel> _chartList = [];
        yield ChartLoadingState();
        _chartList = await chartRepositoty.fetchChart();
        yield ChartLoadedState(chartList: _chartList);
      } catch (e) {
        yield ChartErrorState(errorMessage: e);
      }
    }
  }
}

//bloc completed

// let's deploy this bloc in ui
