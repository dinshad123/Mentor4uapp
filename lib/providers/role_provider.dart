import 'package:flutter/cupertino.dart';
import 'package:mentor4u_app/screens/role_selection_screen.dart';

enum RoleSelection { mentor, mentee }

class RoleProvider extends ChangeNotifier {
  bool _showRadioButton = false;
  RoleSelection? _selectedRole = RoleSelection.mentor;

  bool get showradioButton => _showRadioButton;
  RoleSelection? get selectedRole => _selectedRole;

  void toggleRadioButtons() {
    _showRadioButton = true;
    notifyListeners();
  }

  void selectRole(RoleSelection? role) {
    _selectedRole = role;
    notifyListeners();
  }
}
