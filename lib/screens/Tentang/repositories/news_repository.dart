import 'dart:convert';
import 'package:flutter_covid_dashboard_ui/screens/Tentang/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<ArticleModel>> fetchChart() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=id&category=health&everything?q=corona&apiKey=d15ab917d64b4e00957602ae5ee354b0"));

    var data = jsonDecode(response.body);

    List<ArticleModel> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _artcileModel = ArticleModel.fromJson(item);
        _articleModelList.add(_artcileModel);
      }
      return _articleModelList;
    } else {
      return _articleModelList; // empty list
    }
  }
}
