import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rideapp/models/user.dart';
import 'package:rideapp/provider/user.dart';
import 'package:rideapp/screens/auth/login.dart';
import 'package:rideapp/utils/locator.dart';
import 'package:rideapp/utils/toast.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  // current firebase user
  Future<User?> currentFirebaseUser() async {
    User? firebaseUser = auth.currentUser;
    if (firebaseUser != null) {
      return firebaseUser;
    } else {
      return null;
    }
  }

  // get current user
  Future<Users?> getUser() async {
    User? user = await currentFirebaseUser();
    if (user == null) {
      return null;
    } else {
      return userServ.getCurrentUser();
    }
  }

  //google sign in
  Future googleLogin(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    Users _user = Users();
    try {
      GoogleSignInAccount? user;
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      user = googleUser;
      final googleAuth = await googleUser.authentication;
      _user.accesstoken = googleAuth.accessToken;
      _user.email = user.email;
      userProvider.authUser = _user;
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    } on Exception catch (e) {
      showToast('Error:$e');
    }
  }

  Future fblogin(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    Users _user = Users();
    try {
      final LoginResult loginResult =
          await FacebookAuth.instance.login(permissions: ['email']);

      if (loginResult.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();
        _user.accesstoken = loginResult.accessToken!.token;
        _user.email = userData['email'];
        userProvider.authUser = _user;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
      }
    } on Exception catch (e) {
      showToast('Error:$e');
    }
  }
}
