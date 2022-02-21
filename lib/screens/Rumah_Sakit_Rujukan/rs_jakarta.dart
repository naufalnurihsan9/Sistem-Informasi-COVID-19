import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:flutter_covid_dashboard_ui/screens/Rumah_Sakit_Rujukan/shimmer_rs.dart';
import 'package:flutter_covid_dashboard_ui/screens/Rumah_Sakit_Rujukan/detail_rs.dart';
import 'package:shimmer/shimmer.dart';

class RSJakarta extends StatefulWidget {
  @override
  _RSJakartaState createState() => _RSJakartaState();
}

class _RSJakartaState extends State<RSJakarta> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dataRS = firestore.collection('dataRS');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primaryColor,
          title: Text('Rs Rujukan Jakarta'),
        ),
        backgroundColor: Colors.white,
        body: StreamBuilder<QuerySnapshot>(
          stream: dataRS.where('kota', isEqualTo: "jakarta").snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return GestureDetector(
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot post = snapshot.data.docs[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            snapshot.data.docs[index]['namaRS'],
                            style: dataRsPerKota,
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailRS(
                                post: post,
                              );
                            }));
                          },
                        ),
                      );
                    }),
              );
            } else {
              return ShimmerRS();
            }
          },
        ));
  }
}