import 'dart:io';
import 'package:flutter_covid_dashboard_ui/screens/chart/bloc/chartbloc/chart_bloc.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/bloc/chartbloc/chart_states.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/models/chart_models.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/models/time_series_cases.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Statistik extends StatefulWidget {
  @override
  _StatistikState createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    NumberFormat format = NumberFormat('#,###,###');
    return Container(
      height: screenHeight,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              color: Colors.white,
              // margin: EdgeInsets.only(top: height * 0.08),
              child: BlocBuilder<ChartBloc, ChartStates>(
                builder: (BuildContext context, ChartStates state) {
                  if (state is ChartLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is ChartLoadedState) {
                    List<ChartModel> _chartModel = [];
                    _chartModel = state.chartList;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(left: 20.0),
                            child: Text("Grafik Jumlah Terkonfirmasi")),
                        buildCardChart1(_chartModel),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 20.0),
                            child: Text("Grafik Jumlah Sembuh")),
                        buildCardChart2(_chartModel),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 20.0),
                            child: Text("Grafik Jumlah Meninggal")),
                        buildCardChart3(_chartModel),
                      ],
                    );
                  } else if (state is ChartErrorState) {
                    String error = state.errorMessage;

                    return Center(child: Text(error));
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget buildCardChart1(List<ChartModel> _chartModel) {
    return Card(
      elevation: 1,
      child: Container(
        height: 200,
        // width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: charts.BarChart(
          _createData(_chartModel),
          animate: false,
          defaultRenderer:
              charts.BarRendererConfig(maxBarWidthPx: 40, strokeWidthPx: 1.0),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, String>> _createData(
      List<ChartModel> _chartModel) {
    List<TimeSeriesCases> jumlahPotitif = [];

    for (var item in _chartModel) {
      for (int i = _chartModel.length - 7; i < _chartModel.length; i++) {
        jumlahPotitif.add(new TimeSeriesCases(
            _chartModel[i].key, _chartModel[i].jumlahPotitif.value));
      }
    }

    return [
      new charts.Series<TimeSeriesCases, String>(
        id: 'jumlahPotitif',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.orange),
        domainFn: (TimeSeriesCases cases, _) =>
            DateFormat('dMMMM').format(cases.time),
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: jumlahPotitif,
      ),
    ];
  }

  Widget buildCardChart2(List<ChartModel> _chartModel) {
    return Card(
      elevation: 1,
      child: Container(
        height: 200,
        // width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: charts.BarChart(
          _createData2(_chartModel),
          animate: false,
          defaultRenderer:
              charts.BarRendererConfig(maxBarWidthPx: 40, strokeWidthPx: 1.0),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, String>> _createData2(
      List<ChartModel> _chartModel) {
    List<TimeSeriesCases> jumlahSembuh = [];

    for (var item in _chartModel) {
      for (int i = _chartModel.length - 7; i < _chartModel.length; i++) {
        jumlahSembuh.add(new TimeSeriesCases(
            _chartModel[i].key, _chartModel[i].jumlahSembuh.value));
      }
    }

    return [
      new charts.Series<TimeSeriesCases, String>(
        id: 'jumlahSembuh',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.green),
        domainFn: (TimeSeriesCases cases, _) =>
            DateFormat('dMMMM').format(cases.time),
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: jumlahSembuh,
      ),
    ];
  }

  Widget buildCardChart3(List<ChartModel> _chartModel) {
    return Card(
      elevation: 1,
      child: Container(
        height: 200,
        // width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: charts.BarChart(
          _createData3(_chartModel),
          animate: false,
          defaultRenderer:
              charts.BarRendererConfig(maxBarWidthPx: 40, strokeWidthPx: 1.0),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, String>> _createData3(
      List<ChartModel> _chartModel) {
    List<TimeSeriesCases> jumlahMeninggal = [];

    for (var item in _chartModel) {
      for (int i = _chartModel.length - 7; i < _chartModel.length; i++) {
        jumlahMeninggal.add(new TimeSeriesCases(
            _chartModel[i].key, _chartModel[i].jumlahMeninggal.value));
      }
    }

    return [
      new charts.Series<TimeSeriesCases, String>(
        id: 'jumlahMeninggal',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.red),
        domainFn: (TimeSeriesCases cases, _) =>
            DateFormat('dMMMM').format(cases.time),
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: jumlahMeninggal,
      ),
    ];
  }
}
