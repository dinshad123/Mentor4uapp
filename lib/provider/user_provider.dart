import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:mentor4u_app/models/mentee_model.dart';
import 'package:mentor4u_app/models/mentor_model.dart';
import 'package:mentor4u_app/services/firestore_services.dart';
import 'package:mentor4u_app/widgets/bottom_bar.dart';

class UserProvider extends ChangeNotifier {
  String? _userId;
  MentorModel? _mentorUser;
  MenteeModel? _menteeUser;
  bool? _isDataSaved = false;

  String? get userId => _userId;
  MentorModel? get mentorModel => _mentorUser;
  MenteeModel? get menteeModel => _menteeUser;
  bool? get isDataSaved => _isDataSaved;

  final _firestoreServices = FirestoreServices();

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  void saveUser(
    String userName,
    String role,
    String field,
    File image,
    BuildContext context,
  ) async {
    _isDataSaved = true;
    notifyListeners();
    CloudinaryResponse? res;
    final cloudinary = CloudinaryPublic('dqyzqbj7p', 'w27c26ob');
    try {
      res = await cloudinary.uploadFile(CloudinaryFile.fromFile(image.path,
          resourceType: CloudinaryResourceType.Image));
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
    }

    if (role == 'mentor' && res != null) {
      MentorModel mentorModel = MentorModel(
        field: field,
        name: userName,
        role: role,
        image: res.secureUrl,
        id: userId,
      );
      _isDataSaved = await _firestoreServices.saveUserData(mentorModel);
    } else if (role == 'mentee' && res != null) {
      MenteeModel menteeModel = MenteeModel(
        field: field,
        name: userName,
        role: role,
        image: res.secureUrl,
        id: userId,
      );
      _isDataSaved = await _firestoreServices.saveUserData(menteeModel);
    }

    if (isDataSaved == true) {
      if (context.mounted) {
        Navigator.pushNamed(context, BottomBar.routeName);
      }
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
