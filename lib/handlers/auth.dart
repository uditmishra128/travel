import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rideapp/main.dart';
import 'package:rideapp/models/user.dart';
import 'package:rideapp/provider/auth.dart';
import 'package:rideapp/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:rideapp/screens/auth/detail.dart';
import 'package:rideapp/screens/auth/sign_up.dart';
import 'package:rideapp/screens/dashboard/dashboard.dart';
import 'package:rideapp/screens/onboard/on_board.dart';
import 'package:rideapp/services/auth.dart';
import 'package:rideapp/services/user.dart';
import 'package:rideapp/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

// redirect user to screen according to existance
Future<void> redirectUser(BuildContext context) async {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
  userProvider.currentUser = await locator.get<UserService>().getCurrentUser();
  if (userProvider.currentUser != null) {
    Navigator.pushNamed(context, DashBoardScreen.routeName);
  } else {
    Navigator.of(context).push(PageTransition(
        child: const DetailScreen(), type: PageTransitionType.fade));
  }
}

// register user
registerUser(BuildContext context, String name, String gender) async {
  Error? error =
      await locator.get<UserService>().registerUser(name, gender, context);
  if (error == null) {
    await redirectUser(context);
  } else {
    showToast('Error caught!');
  }
}

// authenticate user for auto login
Future<void> authenticateUser(BuildContext context, String phoneNo) async {
  AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
  await authProvider.verifyPhoneNumber(context, phoneNo);
}

// check whether user logged in or not at splash
checkUserState(BuildContext context) async {
  Users? user = await locator.get<AuthService>().getUser();
  if (user == null) {
    bool seen = await firstTimeVisit();
    if (seen == true) {
      await setSeenTrue();
      Timer(const Duration(seconds: 2),
          () => Navigator.pushNamed(context, SignUpScreen.routeName));
    } else {
      Timer(const Duration(seconds: 2),
          () => Navigator.pushNamed(context, OnBoard.routeName));
    }
  } else {
    Provider.of<UserProvider>(context, listen: false).currentUser = user;
    Timer(const Duration(seconds: 2),
        () => Navigator.pushNamed(context, DashBoardScreen.routeName));
  }
}

// check if first time
Future<bool> firstTimeVisit() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = (prefs.getBool('seen') ?? false);
  return seen;
}

// set onboard seen
Future<void> setSeenTrue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('seen', true);
}
