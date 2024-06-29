import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentor4u_app/firebase_options.dart';
import 'package:mentor4u_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme(
      displayLarge: GoogleFonts.staatliches(
        textStyle: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
      ),
      titleLarge: GoogleFonts.staatliches(
        textStyle: const TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
      ),
      bodyMedium: GoogleFonts.aleo(
        textStyle: const TextStyle(fontSize: 16),
      ),
      bodySmall: GoogleFonts.aleo(
        textStyle: const TextStyle(fontSize: 12),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MENTOR4U',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(94, 188, 103, 1.0),
          brightness: Brightness.light,
        ),
        textTheme: textTheme,
      ),
      home: const SplashScreen(),
    );
  }
}
