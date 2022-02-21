import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/bloc/chartbloc/chart_bloc.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/bloc/chartbloc/chart_states.dart';
import 'package:flutter_covid_dashboard_ui/screens/chart/models/chart_models.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_covid_dashboard_ui/screens/chart/models/time_series_cases.dart';
import 'package:flutter_covid_dashboard_ui/widgets/shimmer_stat_grid.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StatsGrid extends StatefulWidget {
  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  @override
  Widget build(BuildContext context) {
    NumberFormat format = NumberFormat('#,###,###');
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: MediaQuery.of(context).size.height * 1.54,
      child: BlocBuilder<ChartBloc, ChartStates>(
        builder: (BuildContext context, ChartStates state) {
          if (state is ChartLoadingState) {
            return ShimmerStatGrid();
          } else if (state is ChartLoadedState) {
            List<ChartModel> _chartModel = [];
            _chartModel = state.chartList;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    "Data : " +
                        DateFormat('d MMMM yy')
                            .format(_chartModel[_chartModel.length - 1].key),
                    style: textHitam,
                  ),
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildStatCard(
                          'Terkonfirmasi',
                          format.format(_chartModel[_chartModel.length - 1]
                              .jumlahPotitifTotal
                              .value),
                          ("+ " +
                              format.format(_chartModel[_chartModel.length - 1]
                                  .jumlahPotitif
                                  .value)),
                          Colors.orange),
                      _buildStatCard(
                          'Meninggal',
                          format.format(_chartModel[_chartModel.length - 1]
                              .jumlahMeninggaltotal
                              .value),
                          ("+ " +
                              format.format(_chartModel[_chartModel.length - 1]
                                  .jumlahMeninggal
                                  .value)),
                          Colors.red),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildStatCard(
                          'Sembuh',
                          format.format(_chartModel[_chartModel.length - 1]
                              .jumlahSembuhTotal
                              .value),
                          ("+ " +
                              format.format(_chartModel[_chartModel.length - 1]
                                  .jumlahSembuh
                                  .value)),
                          Colors.green),
                      _buildStatCard(
                          'Kasus Aktif',
                          format.format(_chartModel[_chartModel.length - 1]
                              .jumlahDirawatTotal
                              .value),
                          (format.format(_chartModel[_chartModel.length - 1]
                              .jumlahDirawat
                              .value)),
                          Colors.lightBlue),
                    ],
                  ),
                ),
                _buildChart(),
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
    );
  }

  Expanded _buildStatCard(
      String title, String count, String tambahan, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: sidebar),
            Text(
              count,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              tambahan,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildChart() {
    return Stack(
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
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Grafik Jumlah Terkonfirmasi",
                          style: textHitam,
                        )),
                    buildCardChart1(_chartModel),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Grafik Jumlah Sembuh",
                          style: textHitam,
                        )),
                    buildCardChart2(_chartModel),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Grafik Jumlah Meninggal",
                          style: textHitam,
                        )),
                    buildCardChart3(_chartModel),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Grafik Kasus Aktif",
                          style: textHitam,
                        )),
                    buildCardChart4(_chartModel),
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
    );
  }

  Widget buildCardChart1(List<ChartModel> _chartModel) {
    return Card(
      elevation: 1,
      child: Container(
        height: 200,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: charts.BarChart(
          _createData(_chartModel),
          animate: true,
          // selectionModels: [
          //   new charts.SelectionModelConfig(
          //       changedListener: (SelectionModel model) {
          //     print(model.selectedSeries[0]
          //         .measureFn(model.selectedDatum[0].index));
          //   })
          // ],
          defaultRenderer:
              charts.BarRendererConfig(maxBarWidthPx: 40, strokeWidthPx: 2.0),
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
            DateFormat('ddMMM').format(cases.time),
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
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: charts.BarChart(
          _createData2(_chartModel),
          animate: false,
          defaultRenderer:
              charts.BarRendererConfig(maxBarWidthPx: 30, strokeWidthPx: 2.0),
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
            DateFormat('ddMMM').format(cases.time),
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
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: charts.BarChart(
          _createData3(_chartModel),
          animate: false,
          defaultRenderer:
              charts.BarRendererConfig(maxBarWidthPx: 40, strokeWidthPx: 2.0),
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
            DateFormat('ddMMM').format(cases.time),
        measureFn: (TimeSeriesCases cases, _) => cases.cases,
        data: jumlahMeninggal,
      ),
    ];
  }

  Widget buildCardChart4(List<ChartModel> _chartModel) {
    return Card(
      elevation: 1,
      child: Container(
        height: 200,
        // width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
        child: charts.BarChart(
          _createData4(_chartModel),
          animate: false,
          defaultRenderer:
              charts.BarRendererConfig(maxBarWidthPx: 40, strokeWidthPx: 2.0),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases, String>> _createData4(
      List<ChartModel> _chartModel) {
    List<TimeSeriesCases> jumlahDirawat = [];

    for (var item in _chartModel) {
      for (int i = _chartModel.length - 7; i < _chartModel.length; i++) {
        jumlahDirawat.add(new TimeSeriesCases(
            _chartModel[i].key, _chartModel[i].jumlahDirawat.value));
      }
    }

    return [
      new charts.Series<TimeSeriesCases, String>(
          id: 'jumlahDirawat',
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
          domainFn: (TimeSeriesCases cases, _) =>
              DateFormat('ddMMM').format(cases.time),
          measureFn: (TimeSeriesCases cases, _) => cases.cases,
          data: jumlahDirawat),
    ];
  }
}
