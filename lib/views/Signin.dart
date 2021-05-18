import 'package:chat_app/helper/toggel.dart';
import 'package:chat_app/services/auth_Service.dart';
import 'package:chat_app/views/Signup.dart';
import 'package:chat_app/views/main.dart';
import 'package:chat_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.lightGreen,
                          Colors.lightBlue,
                        ]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*Container(
                          height: 180,
                          child: Image.asset("assets/images/logo.png"),
                        ),*/
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Hello Too",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          TextFormField(
                            controller: email,
                            validator: (val) {
                              RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                                      .hasMatch(val!)
                                  // ignore: unnecessary_statements
                                  ? null
                                  // ignore: unnecessary_statements
                                  : "enter valid email";
                            },
                            decoration: InputDecoration(
                              hintText: "email",
                              hintStyle: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (val) {
                              return val!.length < 6 || val.isEmpty
                                  ? "enter password of length grater than 6"
                                  : null;
                            },
                            decoration: InputDecoration(
                              hintText: "password",
                              hintStyle: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            controller: password,
                            //decoration: formStyle("password"),

                            obscureText: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 7),
                              child: Text("Forgot Password"),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await signInWithEmailAndPassword(
                                        email.text.trim(), password.text.trim())
                                    .then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Mainpage()));
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              decoration: BoxDecoration(
                                  /*gradient: LinearGradient(colors: [
                              Colors.lightGreen,
                              Colors.lightBlue,
                            ]),*/
                                  color: Colors.lightGreen[400],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                                /*gradient: LinearGradient(colors: [
                            Colors.lightGreen,
                            Colors.lightBlue,
                          ]),*/
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.lightGreen,
                                )),
                            child: Text(
                              "Sign Up with Google",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.lightGreen[400],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) => Toggle()));
                                },
                                child: Container(
                                  child: Text(
                                    "Register Now",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
