import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/authcontroller.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/meandrawer.dart';
import 'package:project/pages/welcomepage.dart';
var cordinates;
class show_inmap extends StatefulWidget {
  double slat = 0.0, slong = 0.0;
  
  show_inmap({super.key, required this.slat, required this.slong});

  @override
  State<show_inmap> createState() => _show_inmapState();
}

class _show_inmapState extends State<show_inmap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
   ///final cordinate = new Coordinates(double.parse(widget.slat), widget.slong);


  static final CameraPosition _kGoogleplex = const CameraPosition(
      target: LatLng(8.4721939, 76.9410857), zoom: 14.4746);
  void initstate() {
    super.initState();
    loadata();
    double? lattitude = widget.slat;
    double? longitude = widget.slong;
   

    //_marker.addAll(_list);
  }

  void onMapcreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      markers.add(const Marker(
        markerId: MarkerId('1'),
       // position: LatLng(cordinate.lattitude,),
        infoWindow: InfoWindow(
          title: 'Location_found',
          snippet: 'nearby',
        ),
      ));
      /*   markers.add(const Marker(
        markerId: MarkerId('2'),
        position: LatLng(8.474147, 76.938379),
        infoWindow: InfoWindow(
          title: 'Muttathara',
          snippet: 'college',
        ),
      ));
      markers.add(const Marker(
        markerId: MarkerId('3'),
        position: LatLng(8.4721939, 76.9410857),
        infoWindow: InfoWindow(
          title: 'My Location ',
          snippet: 'My Custom Subtitle',
        ),
      ));*/
    });
  }

  Future<Position> getuserCurrentlocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  loadata() {
    getuserCurrentlocation().then((value) async {
      print("my Current location");
      print(value.latitude.toString() + " " + value.longitude.toString());
      markers.add(Marker(
          markerId: MarkerId('5'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(
            title: 'My location',
          )));
      GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 14)));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Locate me!")),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      /// drawer: MeanDrawer(wemail:widget.remail),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGoogleplex,
          //    markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          compassEnabled: true,
          myLocationEnabled: true,
          /* onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },*/
          onMapCreated: onMapcreated,
          markers: markers,
          //onMapCreated: onMapcreated,
          zoomControlsEnabled: true,
        ),
      ),
    );
  }
}
