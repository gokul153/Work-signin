import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:get/get.dart';
String stAdrees = "";

class FindAdress extends StatefulWidget {
  const FindAdress({super.key});

  @override
  State<FindAdress> createState() => _FindAdressState();
}

class _FindAdressState extends State<FindAdress> {
  final _latController = TextEditingController();

  final _logController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Convert Lattitude and longitude to address"),
          centerTitle: true,
        ),
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
var addresses = await Geocoder.local.findAddressesFromQuery(query);
var second = addresses.first;
print("${second.featureName} : ${second.coordinates}");
                final coordinates = new Coordinates(
                    double.parse(_latController.text),
                    double.parse(_logController.text));
                if (coordinates == null) {
                  print("enter proper cordinates");
                 Get.snackbar("About Cordinate", "Not valid",
            snackPosition: SnackPosition.BOTTOM, titleText: Text("failed!"));
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
            ElevatedButton(onPressed: (){}, child: Text("veiw in map"),
            )
          ],
        ),
      ),
    );
  }
}
