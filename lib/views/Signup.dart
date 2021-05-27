import 'package:chat_app/helper/toggel.dart';
import 'package:chat_app/services/auth_Service.dart';
import 'package:chat_app/views/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets.dart';
import 'Home.dart';
import 'package:chat_app/services/database.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          width: double.maxFinite,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/signbg.jpg",
                                ),
                                fit: BoxFit.cover),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    autofocus: true,
                                    validator: (val) {
                                      return val!.isEmpty || val.length < 4
                                          ? "enter username of length grater than 4"
                                          : null;
                                    },
                                    controller: username,
                                    decoration: InputDecoration(
                                      hintText: "username",
                                      hintStyle: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    autofocus: true,
                                    controller: email,
                                    validator: (val) {
                                      return RegExp(
                                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                                              .hasMatch(val!)
                                          ? null
                                          : "enter valid email";
                                    },
                                    decoration: InputDecoration(
                                      hintText: "email",
                                      hintStyle: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ),
                                  TextFormField(
                                    autofocus: true,
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
                                    obscureText: true,
                                    controller: password,
                                  ),
                                  /* TextFormField(
                                    validator: (val) {
                                      // ignore: unrelated_type_equality_checks
                                      return val == password
                                          ? null
                                          : "password didn't match";
                                    },
                                    //controller: password,
                                    decoration: formStyle("confirm Passsword"),
                                    obscureText: true,
                                  ),*/
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  Map<String, String> userMap = {
                                    "Name": username.text,
                                    "email": email.text
                                  };
                                  setState(() {
                                    isLoading = true;
                                  });
                                  print(password.text);
                                  print(email.text);
                                  await signUpWithEmailAndPassword(
                                      email.text.trim(), password.text.trim());
                                  addData(userMap);
                                }
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Mainpage()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Colors.lightGreen,
                                      Colors.lightBlue,
                                    ]),
                                    //color: Colors.lightGreen[400],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Sign Up",
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
                                  "Already have an account? ",
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
                                  child: Text(
                                    "Click here",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
