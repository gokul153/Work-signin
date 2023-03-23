///import 'dart:js';

///import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/welcomepage.dart';

int user_add = 0;

class Authcontroller extends GetxController {
  static final Authcontroller instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _intialScreen);
  }
/*  void counter(BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => welcome()));
      }*/

  _intialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => login());
    } else {
      print("get user to welcome page");
      user_add = 1;
      print("user add updated $user_add");
      Get.offAll(() => welcome(remail:user.email!));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void signin(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          snackPosition: SnackPosition.BOTTOM, titleText: Text("failed!"));
      print("login failed");
    }
  }

  void logout() async {
    await auth.signOut();
  }

  void Register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About user", "User message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Account creation failed!"));
      print("registeration failed");
    }
  }
}

