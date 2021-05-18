import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

usersearch(String name) {
  FirebaseFirestore.instance
      .collection("users")
      .where("Name", isEqualTo: name)
      .get();
}

addData(userMap) {
  FirebaseFirestore.instance.collection("users").add(userMap);
}
