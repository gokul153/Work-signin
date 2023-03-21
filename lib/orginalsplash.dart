//import 'package:b_green/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:project/front.dart';
import 'package:project/login.dart';
//import 'package:b_green/page/splash.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 239, 239),
      body: Container(
        child: Column(children: <Widget>[
          Divider(
            height: 240.0,
            color: Colors.black,
          ),
          new Image.asset(
            'assets/images/Settyl-logo-dark.jpg',
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            width: 300.0,
          ),
          Divider(
            height: 105.2,
            color: Colors.black,
          ),
        ]),
      ),
    );
  }
}
