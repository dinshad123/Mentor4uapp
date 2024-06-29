import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor4u_app/screens/home_screen.dart';

class AuthServices {
  final firebaseauth = FirebaseAuth.instance;
  User? get currentUser => firebaseauth.currentUser;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await firebaseauth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User registered successfully! Please login '),
          ),
        );
      }
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
      if (userCredential.user != null) {
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }
}
