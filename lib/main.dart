//import 'package:chat_app/views/Search.dart';
//import 'package:chat_app/views/Signup.dart';
import 'package:chat_app/helper/toggel.dart';
import 'package:chat_app/views/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'helper/toggel.dart';
//import "views/Signin.dart";
import "views/Home.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Toggle(),
    );
  }
}
