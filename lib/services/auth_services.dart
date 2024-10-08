import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mentor4u_app/provider/user_provider.dart';

import 'package:mentor4u_app/screens/role_selection_screen.dart';
import 'package:provider/provider.dart';

class AuthServices {
  final firebaseauth = FirebaseAuth.instance;
  User? get currentUser => firebaseauth.currentUser;

  Future<UserCredential?> createUserWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential userCredential = await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User registered successfully! Please login '),
          ),
        );
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error creating user:$e';
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
    } catch (e) {
      String errorMessage = 'Error creating user:$e';
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
    }
  }

  Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      final userCredential = await firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (context.mounted) {
        final roleProvider = Provider.of<UserProvider>(context, listen: false);
        if (user != null) {
          roleProvider.setUserId(user.uid);
        }
      }

      if (userCredential.user != null) {
        if (context.mounted) {
          Navigator.pushNamed(context, RoleSelectionScreen.routeName);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        Fluttertoast.showToast(msg: '$e');
      }
    }
  }
}
