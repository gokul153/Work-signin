import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:project/authcontroller.dart';
import 'package:project/login.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

var user = "";

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();
  bool isApicallprocess = false;
  bool hide_password = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(248, 69, 61, 186),
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginui(context),
          ),
          // inAsyncCall: isApicallprocess,
          //  key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginui(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 18, 17, 17),
                    Color.fromARGB(255, 44, 10, 234),
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/login.jpg",
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 251, 248, 248),
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
                /*  FormHelper.inputFieldWidget(
                    context,
                   prefixico
                  
                //     Icon? : Icons.person,
                    "username",
                    //"userName", 
                    (onValidateVal) {
                  if (onValidateVal.isEmpty()) {
                    return "username ,can \'t be empty.";
                  }
                  return null;
                },
                    (onSaved){
                   username =onSaved;
                  },
                  borderColor: Colors.black,
                  borderErrorColor: Colors.red,
                  prefixIconColor: Colors.white,
                )*/
                const SizedBox(height: 50),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 248, 242, 242)),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.amberAccent),
                      hintText: "enter your email",
                      hintStyle: TextStyle(color: Colors.white),
                      //  errorText: "enter valid_email"
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (email) {},
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.1,
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 242, 239, 239)),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextFormField(
                      scrollPadding: EdgeInsets.all(3.0),
                      controller: _passwordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.amberAccent),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "password",
                          border: InputBorder.none),
                      obscureText: true,
                      validator: (password) {}),
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Sign into your account",
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                        onPressed: () {
                          Authcontroller.instance.signin(
                              _emailController.text.trim(), _passwordController.text.trim());
                        },
                        child: Text("Sign In"))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                RichText(
                  text: TextSpan(
                      text: "Don\'t have an account?",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text: " Sign Up!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const create()),
                                    )
                                  }
                            //Get.to(() => createacc())
                            ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
