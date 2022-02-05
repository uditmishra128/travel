import 'package:flutter/material.dart';
import 'package:rideapp/screens/auth/sign_up.dart';
import 'package:rideapp/screens/dashboard/dashboard.dart';
import 'package:rideapp/screens/onboard/on_board.dart';
import 'package:rideapp/screens/onboard/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  OnBoard.routeName: (context) => const OnBoard(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  DashBoardScreen.routeName: (context) => const DashBoardScreen(),
};
