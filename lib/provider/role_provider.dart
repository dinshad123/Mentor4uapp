import 'package:flutter/cupertino.dart';
import 'package:mentor4u_app/models/user_model.dart';
import 'package:mentor4u_app/services/firestore_services.dart';

class RoleProvider extends ChangeNotifier {
  bool _showRadioButton = false;
  RoleSelection? _selectedRole;
  String? _userId;
  UserModel? _user;

  bool get showradioButton => _showRadioButton;
  RoleSelection? get selectedRole => _selectedRole;
  String? get userId => _userId;
  UserModel? get userModel => _user;

  final _firestoreServices = FirestoreServices();

  void toggleRadioButtons() {
    _showRadioButton = true;
    notifyListeners();
  }

  void selectRole(RoleSelection role) {
    _selectedRole = role;
    notifyListeners();
  }

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  void saveRole() async {
    print("hello hai 1st$userId");
    if (userId != null && selectedRole != null) {
      print("hello hai 2nd");
      _user = UserModel(id: userId, role: selectedRole);
      print('this is my data $_user!.toMap()');
      await _firestoreServices.saveUserData(_user!);
    }
  }
}
