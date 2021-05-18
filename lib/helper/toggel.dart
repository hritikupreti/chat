import 'package:chat_app/views/Signin.dart';
import 'package:chat_app/views/Signup.dart';
import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool authenticateState = true;
  @override
  Widget build(BuildContext context) {
    if (authenticateState) {
      authenticateState = !authenticateState;

      return SignUp();
    } else {
      authenticateState = !authenticateState;

      return SignIn();
    }
  }
}
