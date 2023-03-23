import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project/authcontroller.dart';
import 'package:project/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:project/pages/welcomepage.dart';

class create extends StatelessWidget {
  const create({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: createacc(),
    );
  }
}

class createacc extends StatefulWidget {
  const createacc({super.key});

  @override
  State<createacc> createState() => _createaccState();
}

class _createaccState extends State<createacc> {
  final _username = TextEditingController();
  final _lastname = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name ',
                    contentPadding: EdgeInsets.all(8.0),
                    prefixIcon: Icon(Icons.person),
                    // border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Last Name ',
                    contentPadding: EdgeInsets.all(8.0),
                    // border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.message_rounded,
                      color: Colors.redAccent,
                    ),
                    labelText: 'Email',
                    contentPadding: EdgeInsets.all(8.0),
                    // border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.redAccent,
                    ),
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  user_add = 0;
                  user = _username.text + _lastname.text;
                  print(user);
                  Authcontroller.instance.Register(emailcontroller.text.trim(),
                      passwordcontroller.text.trim());

                  print("username $user , update  user $user_add");
                  if (user_add == 1) {
                    final snackBar = SnackBar(
                      content: Text('User succesfull Created go to Login!'),
                      duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //  navigatewelcome();
                  }
                },
                child: Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
