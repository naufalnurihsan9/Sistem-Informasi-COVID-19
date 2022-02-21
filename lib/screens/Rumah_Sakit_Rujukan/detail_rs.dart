import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_covid_dashboard_ui/config/palette.dart';
import 'package:flutter_covid_dashboard_ui/config/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailRS extends StatefulWidget {
  DocumentSnapshot post;

  DetailRS({this.post});

  @override
  _DetailRSState createState() => _DetailRSState();
}

class _DetailRSState extends State<DetailRS> {
  GoogleMapController myControler;

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId('Rumah Sakit Rujukan COVID'),
            position: LatLng(widget.post.get('lokasi').latitude,
                widget.post.get('lokasi').longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: widget.post.get('namaRS')))
      ].toSet();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
        title: Text(widget.post.get('namaRS')),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Nama RS
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Rumah Sakit : ", style: detailRS),
                    Text(widget.post.get('namaRS'), style: isiDetailRS),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Nomor Telpon : ", style: detailRS),
                    Text(widget.post.get('notlp'), style: isiDetailRS),
                  ],
                ),
              ),

              //Alamat RS
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Alamat: ", style: detailRS),
                    Text(widget.post.get('alamatRS'), style: isiDetailRS),
                  ],
                ),
              ),

              //Maps RS
              Container(
                  padding: EdgeInsets.only(top: 25),
                  width: double.infinity,
                  height: 350,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GoogleMap(
                        markers: getMarker(),
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(widget.post.get('lokasi').latitude,
                              widget.post.get('lokasi').longitude),
                          zoom: 16.0,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          myControler = controller;
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
