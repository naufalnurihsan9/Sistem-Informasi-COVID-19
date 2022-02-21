// import 'package:flutter/material.dart';
// import 'package:flutter_covid_dashboard_ui/api/dunia_case.dart';
// import 'package:flutter_covid_dashboard_ui/config/styles.dart';
// import 'package:flutter_covid_dashboard_ui/widgets/shimmer_stat_grid.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

// class StatsGridDunia extends StatefulWidget {
//   @override
//   _StatsGridDuniaState createState() => _StatsGridDuniaState();
// }

// class _StatsGridDuniaState extends State<StatsGridDunia> {
//   Future<DuniaCase> futureDuniaCase;

//   @override
//   void initState() {
//     super.initState();
//     futureDuniaCase = fetchDuniaCase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     NumberFormat format = NumberFormat('#,###,###');
//     return Container(
//         margin: EdgeInsets.only(top: 5),
//         height: MediaQuery.of(context).size.height * 0.3,
//         child: FutureBuilder<DuniaCase>(
//             future: futureDuniaCase,
//             builder: (BuildContext context, snapshot) {
//               if (snapshot.hasError) return Center(child: Text("Error"));
//               switch (snapshot.connectionState) {
//                 case ConnectionState.waiting:
//                   return ShimmerStatGrid();
//                 default:
//                   return !snapshot.hasData
//                       ? Center(
//                           child: Text("data kosong"),
//                         )
//                       : Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 5.0),
//                               child: Text(
//                                 "Data : " +
//                                     DateFormat('d MMMM yy')
//                                         .format(snapshot.data.updated),
//                                 style: textHitam,
//                               ),
//                             ),
//                             Flexible(
//                               child: Row(
//                                 children: <Widget>[
//                                   _buildStatCard(
//                                       'Total Kasus',
//                                       format.format(snapshot.data.cases),
//                                       ("+ " +
//                                           format.format(
//                                               snapshot.data.todayCases)),
//                                       Colors.orange),
//                                   _buildStatCard(
//                                       'Meninggal',
//                                       format.format(snapshot.data.deaths),
//                                       ("+ " +
//                                           format.format(
//                                               snapshot.data.todayDeaths)),
//                                       Colors.red),
//                                 ],
//                               ),
//                             ),
//                             Flexible(
//                               child: Row(
//                                 children: <Widget>[
//                                   _buildStatCard(
//                                       'Sembuh',
//                                       format.format(snapshot.data.recovered),
//                                       ("+ " +
//                                           format.format(
//                                               snapshot.data.todayRecovered)),
//                                       Colors.green),
//                                   _buildStatCard(
//                                       'Kasus Aktif',
//                                       format.format(snapshot.data.active),
//                                       "",
//                                       Colors.lightBlue),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//               }
//             }));
//   }

//   Expanded _buildStatCard(
//       String title, String count, String tambahan, MaterialColor color) {
//     return Expanded(
//       child: Container(
//         height: 220,
//         margin: const EdgeInsets.all(5.0),
//         padding: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(title, style: sidebar),
//             Text(
//               count,
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               tambahan,
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
