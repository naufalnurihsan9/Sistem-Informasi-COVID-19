import 'dart:convert';
import 'package:flutter_covid_dashboard_ui/screens/chart/models/chart_models.dart';
import 'package:http/http.dart' as http;

class ChartRepository {
  Future<List<ChartModel>> fetchChart() async {
    var response = await http
        .get(Uri.parse("https://data.covid19.go.id/public/api/update.json"));

    var data = jsonDecode(response.body);

    List<ChartModel> _chartModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["update"]["harian"]) {
        ChartModel _chartModel = ChartModel.fromJson(item);
        _chartModelList.add(_chartModel);
      }
      return _chartModelList;
    } else {
      return _chartModelList; // empty list
    }
  }
}
