import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:project/pages/meandrawer.dart';
import 'package:project/pages/showinmap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

String stAdrees = "";

class FindAdress extends StatefulWidget {
  FindAdress({super.key});

  @override
  State<FindAdress> createState() => _FindAdressState();
}

class _FindAdressState extends State<FindAdress> {
  double lat = 0.0;
  double long = 0.0;
  String map_api = 'AIzaSyDtuBoot4NIjYpdFMyPvyoWTnnnIthBV0k';
  final _latController = TextEditingController();
  String aemail = "";
  final _logController = TextEditingController();
  Future<void> _openMap(String lat, String long) async {
    String url =
        "https://maps.google.com/maps/search/?api=$map_api&query=$lat,$long";
    print(url);
    await canLaunchUrlString(url)
        ? await launchUrlString(url)
        : throw 'couild not open $url';
    // return 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Convert Latt and long to Address"),
          centerTitle: true,
        ),
        drawer: MeanDrawer(wemail: aemail),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                scrollPadding: EdgeInsets.all(3.0),
                controller: _latController,
                decoration: InputDecoration(
                    labelText: "Enter lattitude",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 205, 8, 8)),
                    hintText: "Lattitude",
                    border: InputBorder.none)),
            TextFormField(
                scrollPadding: EdgeInsets.all(3.0),
                controller: _logController,
                decoration: InputDecoration(
                    labelText: "Enter Longitude",
                    labelStyle: TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 205, 8, 8)),
                    hintText: "Longitude",
                    border: InputBorder.none)),
            /* Row(
              children: [
                TextFormField(
                    scrollPadding: EdgeInsets.all(3.0),
                    controller: _latController,
                    decoration: InputDecoration(
                        labelText: "Enter lattitude",
                        labelStyle: TextStyle(color: Colors.amberAccent),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Lattitude",
                        border: InputBorder.none)),
                TextFormField(
                    scrollPadding: EdgeInsets.all(3.0),
                    controller: _logController,
                    decoration: InputDecoration(
                        labelText: "Enter Longitude",
                        labelStyle: TextStyle(color: Colors.amberAccent),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Longitude",
                        border: InputBorder.none)),
              ],
            ),*/
            GestureDetector(
              onTap: () async {
                final query = "1600 Amphiteatre Parkway, Mountain View";
                var addresses =
                    await Geocoder.local.findAddressesFromQuery(query);
                var second = addresses.first;
                print("${second.featureName} : ${second.coordinates}");

                final coordinates = new Coordinates(
                    double.parse(_latController.text),
                    double.parse(_logController.text));
                setState(() {
                  lat = double.parse(_latController.text);
                  long = double.parse(_logController.text);
                });
                print("the given lattitude and logitude is: $lat,$long");
                if (coordinates == null ||
                    _latController.text == null ||
                    _logController.text == null) {
                  print("enter proper cordinates");
                  Get.snackbar("About Cordinate", "Not valid",
                      snackPosition: SnackPosition.BOTTOM,
                      titleText: Text("failed!"));
                } else {
                  var address = await Geocoder.local
                      .findAddressesFromCoordinates(coordinates);
                  var first = address.first;
                  print("Address :" +
                      first.featureName.toString() +
                      first.addressLine.toString());
                  setState(() {
                    stAdrees = first.featureName.toString() +
                        first.addressLine.toString();
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text("Convert"),
                  ),
                ),
              ),
            ),
            Text(stAdrees),
            ElevatedButton(
              onPressed: () {
                
                MapsLauncher.launchCoordinates(
                    lat, long, 'Google Headquarters are here');
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => show_inmap(slat:lat,slong:long),
                    ));*/
                //  _openMap(lat.toString(), long.toString());
              },
              child: Text("veiw in map"),
            )
          ],
        ),
      ),
    );
  }
}
