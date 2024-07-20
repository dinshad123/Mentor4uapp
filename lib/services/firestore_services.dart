import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mentor4u_app/models/mentee_model.dart';

class FirestoreServices {
  final _db = FirebaseFirestore.instance;

  Future<void> saveUserData(dynamic user) async {
    try {
      if (user.role == 'mentor') {
        await _db.collection('mentor').doc(user.id).set(user.toMap());
      } else {
        await _db.collection('mentee').doc(user.id).set(user.toMap());
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.green,
      );
    }
  }

  Future<void> updateUserData(dynamic user) async {
    try {
      await _db.collection('user').doc(user.id).update(user.toMap());
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.green,
      );
    }
  }
}
