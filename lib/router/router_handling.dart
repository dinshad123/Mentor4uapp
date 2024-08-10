import 'package:flutter/material.dart';
import 'package:mentor4u_app/screens/auth_screen.dart';
import 'package:mentor4u_app/screens/field_selection_screen.dart';
import 'package:mentor4u_app/screens/home_screen.dart';
import 'package:mentor4u_app/screens/role_selection_screen.dart';
import 'package:mentor4u_app/widgets/bottom_bar.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AuthScreen(),
      );

    case RoleSelectionScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const RoleSelectionScreen(),
      );
    case FieldSelectionScreen.routeName:
      var role = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => FieldSelectionScreen(
          role: role,
        ),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exist!'),
                ),
              ));
  }
}
