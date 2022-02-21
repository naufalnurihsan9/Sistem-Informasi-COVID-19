import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/screens/Rumah_Sakit_Rujukan/rs_bekasi.dart';
import 'package:flutter_covid_dashboard_ui/screens/Rumah_Sakit_Rujukan/rs_bogor.dart';
import 'package:flutter_covid_dashboard_ui/screens/Rumah_Sakit_Rujukan/rs_depok.dart';
import 'package:flutter_covid_dashboard_ui/screens/Rumah_Sakit_Rujukan/rs_jakarta.dart';
import 'package:flutter_covid_dashboard_ui/screens/Rumah_Sakit_Rujukan/rs_tanggerang.dart';

class RsRujukan extends StatefulWidget {
  @override
  _RsRujukanState createState() => _RsRujukanState();
}

class _RsRujukanState extends State<RsRujukan> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildRSJakarta(screenHeight),
          _buildRSBogor(screenHeight),
          _buildRSDepok(screenHeight),
          _buildRSTanggerang(screenHeight),
          buildRSbekasi(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('RS Rujukan COVID-19',
                    textAlign: TextAlign.center, style: judulHalaman),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRSJakarta(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RSJakarta();
          }));
        },
        child: Container(
            width: 80.0,
            height: 60.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('RS di Jakarta',
                        textAlign: TextAlign.center, style: dataRs),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            )),
      ),
    );
  }

  SliverToBoxAdapter _buildRSBogor(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RSBogor();
          }));
        },
        child: Container(
            width: 80.0,
            height: 60.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('RS di Bogor',
                        textAlign: TextAlign.center, style: dataRs),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            )),
      ),
    );
  }

  SliverToBoxAdapter _buildRSDepok(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RSDepok();
          }));
        },
        child: Container(
            width: 80.0,
            height: 60.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('RS di Depok',
                        textAlign: TextAlign.center, style: dataRs),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            )),
      ),
    );
  }

  SliverToBoxAdapter _buildRSTanggerang(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RSTanggerang();
          }));
        },
        child: Container(
            width: 80.0,
            height: 60.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('RS di Tanggerang',
                        textAlign: TextAlign.center, style: dataRs),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            )),
      ),
    );
  }

  SliverToBoxAdapter buildRSbekasi(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RSBekasi();
          }));
        },
        child: Container(
            width: 80.0,
            height: 60.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('RS di Bekasi',
                        textAlign: TextAlign.center, style: dataRs),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),
              ],
            )),
      ),
    );
  }
}
