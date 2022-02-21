import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/screens/Tentang/blocs/newsbloc/news_bloc.dart';
import 'package:flutter_covid_dashboard_ui/screens/Tentang/blocs/newsbloc/news_states.dart';
import 'package:flutter_covid_dashboard_ui/screens/Tentang/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covid_dashboard_ui/screens/Tentang/models/shimmer_berita.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

class HomeScreenBerita extends StatefulWidget {
  @override
  _HomeScreenBeritaState createState() => _HomeScreenBeritaState();
}

class _HomeScreenBeritaState extends State<HomeScreenBerita> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              color: Colors.white,
              // margin: EdgeInsets.only(top: height * 0.08),
              child: BlocBuilder<NewsBloc, NewsStates>(
                builder: (BuildContext context, NewsStates state) {
                  if (state is NewsLoadingState) {
                    return ShimmerBerita();
                  } else if (state is NewsLoadedState) {
                    List<ArticleModel> _articleList = [];
                    _articleList = state.articleList;
                    return ListView.builder(
                        itemCount: _articleList.length,
                        itemBuilder: (context, index) {
                          DateTime dateTime =
                              DateTime.parse(_articleList[index].publishedAt);
                          dateTime = dateTime.add(Duration(hours: 7));
                          return GestureDetector(
                            onTap: () async {
                              if (Platform.isAndroid) {
                                FlutterWebBrowser.openWebPage(
                                  url: _articleList[index].url,
                                  customTabsOptions: CustomTabsOptions(
                                    colorScheme: CustomTabsColorScheme.dark,
                                    toolbarColor: Colors.deepPurple,
                                    secondaryToolbarColor: Colors.green,
                                    navigationBarColor: Colors.amber,
                                    addDefaultShareMenuItem: true,
                                    instantAppsEnabled: true,
                                    showTitle: true,
                                    urlBarHidingEnabled: true,
                                  ),
                                );
                              } else if (Platform.isIOS) {
                                FlutterWebBrowser.openWebPage(
                                  url: _articleList[index].url,
                                  safariVCOptions: SafariViewControllerOptions(
                                    barCollapsingEnabled: true,
                                    preferredBarTintColor: Colors.green,
                                    preferredControlTintColor: Colors.amber,
                                    dismissButtonStyle:
                                        SafariViewControllerDismissButtonStyle
                                            .close,
                                    modalPresentationCapturesStatusBarAppearance:
                                        true,
                                  ),
                                );
                              } else {
                                await FlutterWebBrowser.openWebPage(
                                    url: _articleList[index].url);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        color: Colors.grey,
                                        offset: Offset(0, 2),
                                        spreadRadius: 1)
                                  ]),
                              height: height * 0.17,
                              margin: EdgeInsets.only(
                                  bottom: height * 0.01,
                                  top: height * 0.01,
                                  left: width * 0.02,
                                  right: width * 0.02),
                              child: Row(
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    height: height * 0.17,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              _articleList[index].urlToImage !=
                                                      null
                                                  ? _articleList[index]
                                                      .urlToImage
                                                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSojwMMYZgtiupM4Vzdb5iBeE4b0Mamf3AgrxQJR19Xa4oIWV5xun9a02Ggyh4bZAurP_c&usqp=CAU",
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: height * 0.02,
                                        width: width * 0.55,
                                        child: Text(
                                            DateFormat('dd/MM/yyyy - hh:mm')
                                                .format(dateTime),
                                            overflow: TextOverflow.clip,
                                            style: publishat),
                                      ),
                                      Container(
                                        height: height * 0.15,
                                        width: width * 0.55,
                                        padding: EdgeInsets.symmetric(
                                            vertical: height * 0.01),
                                        child: Text(_articleList[index].title,
                                            overflow: TextOverflow.clip,
                                            style: beritaStyle),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  } else if (state is NewsErrorState) {
                    String error = state.errorMessage;

                    return Center(child: Text(error));
                  } else {
                    return ShimmerBerita();
                  }
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
