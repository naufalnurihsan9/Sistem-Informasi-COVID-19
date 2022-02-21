import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFakta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
                title: SizedBox(
              child: Container(
                color: Colors.grey,
              ),
              height: 20.0,
            ));
          }),
      baseColor: Colors.white,
      highlightColor: Colors.grey[400],
      period: Duration(seconds: 2),
    );
  }
}
