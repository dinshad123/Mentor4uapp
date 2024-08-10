import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mentor4u_app/models/mentor_model.dart';
import 'package:mentor4u_app/services/firestore_services.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final firestoreServices = FirestoreServices();

  List<MentorModel> _mentors = [];
  String? _errorMessage;
  bool _isLoading = false;

  List<MentorModel> get mentors => _mentors;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  set mentor(List<MentorModel> mentor) {
    _mentors = mentor;
    notifyListeners();
  }

  Future<void> fetchMentorsByField(String field) async {
    isLoading = true;
    errorMessage = null;
    try {
      mentor = await firestoreServices.fetchMentorsByField(field);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
