import 'package:flutter/material.dart';
import 'package:rideapp/models/user.dart';

class UserProvider with ChangeNotifier {
  Users? _currentUser;
  Users? _authUser;
  Users? get currentUser => _currentUser;

  Users? get authUser => _authUser;

  set currentUser(Users? user) {
    _currentUser = user;
    notifyListeners();
  }

  set authUser(Users? user) {
    _authUser = user;
    notifyListeners();
  }
}
