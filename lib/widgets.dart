import 'package:flutter/material.dart';

InputDecoration formStyle(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      color: Colors.blueGrey[900],
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.lightGreenAccent),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.lightGreenAccent),
    ),
  );
}
