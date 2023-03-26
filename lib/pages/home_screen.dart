import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/authcontroller.dart';
import 'package:project/login.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/meandrawer.dart';
import 'package:project/pages/welcomepage.dart';

class home_page extends StatefulWidget {
  String hemail;
  String name = "";
  home_page({super.key, required this.hemail});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String checkname = widget.hemail;
    print(checkname);
    int len = checkname.length;
    for (int i = 0; i < len - 1; i++) {
      if (checkname[i] != "@") {
        name = name + checkname[i];
      } else {
        break;
      }
    }
    print("user is$name");
    setState(() {
      name = name;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home_Screen"),
      ),
      drawer: MeanDrawer(wemail: widget.hemail),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       
        Center(
          child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          //   image: NetworkImage('https://i.pravatar.cc/300')
                          image: AssetImage('assets/images/login.jpg'),
                        ),
                      ),
                    ),
        ),
        Row(
          children: [
             Text(
          'Welcome,',
          style: GoogleFonts.pinyonScript(
            fontSize: 50,
          ),
        ),
            
          ],
        ),
        Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: GoogleFonts.akshar(
                fontSize: 25,
              ),
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
      ]),
    );
  }
}
