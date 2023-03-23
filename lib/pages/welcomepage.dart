import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/authcontroller.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/welcomepage.dart';

class welcome extends StatelessWidget {
  String remail;
  welcome({super.key, required this.remail});
  void cropname(){

  }
  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      home: autherize(email: remail)
    );*/
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Loacte me!")),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
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
              '$remail',
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
      ),
    );
  }
}
