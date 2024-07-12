import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mentor4u_app/models/user_model.dart';

class FirestoreServices {
  final _db = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel user) async {
    try {
      print(user.role.toString());
      await _db.collection('user').doc(user.id).set(user.toMap());
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.green,
      );
    }
  }
}
