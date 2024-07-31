import 'package:flutter/cupertino.dart';
import 'package:mentor4u_app/models/mentee_model.dart';

import 'package:mentor4u_app/models/mentor_model.dart';
import 'package:mentor4u_app/services/firestore_services.dart';

class UserProvider extends ChangeNotifier {
  String? _userId;
  MentorModel? _mentorUser;
  MenteeModel? _menteeUser;

  String? get userId => _userId;
  MentorModel? get mentorModel => _mentorUser;
  MenteeModel? get menteeModel => _menteeUser;

  final _firestoreServices = FirestoreServices();

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  void saveUser(
    String userName,
    String role,
    String field,
  ) async {
    if (role == 'mentor') {
      MentorModel mentorModel = MentorModel(
        field: field,
        name: userName,
        role: role,
        id: userId,
      );
      await _firestoreServices.saveUserData(mentorModel);
    } else {
      MenteeModel menteeModel = MenteeModel(
        field: field,
        name: userName,
        role: role,
        id: userId,
      );
      await _firestoreServices.saveUserData(menteeModel);
    }
  }

  // void updateUser() async {
//     if (selectedField != null) {
//       print('it worked $selectedField');
//       print("it is name $userName");
//       _user = UserModel(
//         id: userId,
//         role: selectedRole,
//         name: userName,
//         field: selectedField,
//       );
//       await _firestoreServices.updateUserData(_user!);
//     }
//   }
}
