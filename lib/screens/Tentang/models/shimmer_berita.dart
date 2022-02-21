import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBerita extends StatefulWidget {
  @override
  _ShimmerBeritaState createState() => _ShimmerBeritaState();
}

class _ShimmerBeritaState extends State<ShimmerBerita> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
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
              height: height * 0.15,
              margin: EdgeInsets.only(
                  bottom: height * 0.01,
                  top: height * 0.01,
                  left: width * 0.02,
                  right: width * 0.02),
              child: Row(
                children: [
                  Container(
                    width: width * 0.3,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Container(
                    height: height * 0.15,
                    width: width * 0.55,
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  )
                ],
              ),
            );
          }),
      baseColor: Colors.white,
      highlightColor: Colors.grey[400],
      period: Duration(seconds: 2),
    );
  }
}
