import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mentor4u_app/assets.dart';
import 'package:mentor4u_app/screens/auth_screen.dart';
import 'package:mentor4u_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoHome();
  }

  void _navigatetoHome() async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
      () {},
    );
    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const AuthScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            logo,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ));
  }
}
