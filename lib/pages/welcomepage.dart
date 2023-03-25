import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/authcontroller.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/meandrawer.dart';
import 'package:project/pages/welcomepage.dart';

class welcome extends StatefulWidget {
  String remail;
  welcome({super.key, required this.remail});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};

  static final CameraPosition _kGoogleplex = const CameraPosition(
      target: LatLng(8.4721939, 76.9410857), zoom: 14.4746);
  List<Marker> _marker = [];
  //List<Marker> _list = const [
  /* Marker(
      markerId: MarkerId('1'),
      position: LatLng(13.007488, 77.598656),
      infoWindow: InfoWindow(
        title: "my position",
      ),
    ),*/
  //];
  //void cropname() {}
  void initstate() {
    super.initState();
    loadata();
    //_marker.addAll(_list);
  }

  void onMapcreated(GoogleMapController controller) { 
    _controller.complete(controller);
    setState(() {
      markers.add(const Marker(
        markerId: MarkerId('1'),
        position: LatLng(8.470754, 76.957105),
        infoWindow: InfoWindow(
          title: 'Manacaud',
          snippet: 'nearby',
        ),
      ));
      markers.add(const Marker(
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
      ));
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
    /*return MaterialApp(
      home: autherize(email: remail)
    );*/
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Locate me!")),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MeanDrawer(),
      /*   body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: GoogleFonts.pinyonScript(
              fontSize: 50,
            ),
             
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
              '${widget.remail}',
              style: GoogleFonts.roboto(
                fontSize: 15,
              ),
              ),
            ),
          Center(
              child: ElevatedButton.icon(
                  onPressed: () {
                    Authcontroller.instance.logout();
                  },
                  icon: Icon(Icons.logout_outlined),
                  label: Text("log out"))),
            
        ],
      ),*/
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
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.location_disabled_outlined,
          ),
          onPressed: () async {
            getuserCurrentlocation().then((value) async {
              print("my Current location");
              print(
                  value.latitude.toString() + " " + value.longitude.toString());
              markers.add(Marker(
                  markerId: MarkerId('5'),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My location',
                  )));
              GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(value.latitude, value.longitude),
                      zoom: 14)));
              setState(() {});
            });

            /*   GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: LatLng(8.470754, 76.957105), zoom: 14)));*/
          }),
    );
  }
}
