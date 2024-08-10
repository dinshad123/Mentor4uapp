import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mentor4u_app/models/mentor_model.dart';

class FirestoreServices {
  final _db = FirebaseFirestore.instance;

  Future<bool> saveUserData(dynamic user) async {
    try {
      if (user.role == 'mentor') {
        await _db.collection('mentor').doc(user.id).set(user.toMap());
      } else {
        await _db.collection('mentee').doc(user.id).set(user.toMap());
      }

      return true;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.green,
      );
      return false;
    }
  }

  Future<List<MentorModel>> fetchMentorsByField(String field) async {
    try {
      final QuerySnapshot snapshot =
          await _db.collection('mentor').where('field', isEqualTo: field).get();
      if (snapshot.docs.isEmpty) {
        return [];
      }
      final List<MentorModel> mentors = snapshot.docs
          .map((doc) => MentorModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return mentors;
    } catch (e) {
      throw Exception('An Error occures $e');
    }
  }
}
