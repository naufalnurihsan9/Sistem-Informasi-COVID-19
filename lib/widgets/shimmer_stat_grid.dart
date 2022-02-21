import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_covid_dashboard_ui/widgets/shimmer_stat_grid.dart';

class ShimmerStatGrid extends StatefulWidget {
  @override
  _ShimmerStatGridState createState() => _ShimmerStatGridState();
}

class _ShimmerStatGridState extends State<ShimmerStatGrid> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        margin: EdgeInsets.only(top: 5),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('Total Kasus', '', (''), Colors.orange),
                  _buildStatCard('Meninggal', '', (''), Colors.red),
                ],
              ),
            ),
            Flexible(
              child: Row(
                children: <Widget>[
                  _buildStatCard('Sembuh', '', '', Colors.green),
                  _buildStatCard('Kasus Aktif', '', "", Colors.lightBlue),
                ],
              ),
            ),
          ],
        ),
      ),
      baseColor: Colors.white,
      highlightColor: Colors.grey[400],
      period: Duration(seconds: 2),
    );
  }

  Expanded _buildStatCard(
      String title, String count, String tambahan, MaterialColor color) {
    return Expanded(
      child: Container(
        height: 220,
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
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              tambahan,
              style: const TextStyle(
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
}
