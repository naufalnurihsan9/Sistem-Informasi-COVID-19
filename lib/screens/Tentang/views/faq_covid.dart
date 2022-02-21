import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_dashboard_ui/screens/Tentang/models/shimmer_fakta.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqCovid extends StatefulWidget {
  @override
  _FaqCovidState createState() => _FaqCovidState();
}

class _FaqCovidState extends State<FaqCovid> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pathFakta = firestore.collection('Fakta');

    return Container(
      height: screenHeight,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Container(
                color: Colors.white,
                // margin: EdgeInsets.only(top: height * 0.08),
                child: StreamBuilder<QuerySnapshot>(
                  stream: pathFakta.snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          controller: _scrollController,
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (context, index) {
                            var deskripsi =
                                snapshot.data.docs[index]['deskripsi'];
                            return Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: ExpansionTile(
                                onExpansionChanged: onListExpansionChanged,
                                title: Text(
                                  snapshot.data.docs[index]['judul'],
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 2, bottom: 2, left: 15),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      deskripsi.replaceAll("\\n", "\n"),
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ShimmerFakta();
                    }
                  },
                ))
          ],
        )),
      ),
    );
  }

  onListExpansionChanged(bool expanded) {
    //returns if it was expanded (true) or collapsed (false)
    if (expanded) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }
}
