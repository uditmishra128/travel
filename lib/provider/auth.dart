import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rideapp/handlers/auth.dart';
import 'package:rideapp/utils/locator.dart';
import 'package:rideapp/utils/toast.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
  registering,
  otpSend
}

class AuthProvider extends ChangeNotifier {
  Status _status = Status.uninitialized;
  String? verificationID;
  Status get status => _status;

  AuthProvider() {
    authServ.auth.authStateChanges().listen(onAuthStateChanged);
    // onAuthStateChanged.listen(onAuthStateChanged)
  }

  //detect live auth changes
  Future<void> onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
    } else {
      // authServ.userFromFirebase(firebaseUser);
      _status = Status.authenticated;
    }
    notifyListeners();
  }

  // phone auth
  Future<void> verifyPhoneNumber(BuildContext context, String number) async {
    Future<void> verificationCompleted(
        AuthCredential phoneAuthCredential) async {
      debugPrint('Auto verify init');
      UserCredential result =
          await authServ.auth.signInWithCredential(phoneAuthCredential);

      if (result != null) {
        _status = Status.authenticated;
        notifyListeners();
        await redirectUser(context);
      } else {
        _status = Status.unauthenticated;
        notifyListeners();
      }
    }

    PhoneVerificationFailed verificationFailed(
        FirebaseAuthException authException) {
      _status = Status.unauthenticated;
      notifyListeners();
      showToast(authException.message!);
      throw authException;
    }

    Future<void> codeSent(String verificationId,
        [int? forceResendingToken]) async {
      _status = Status.otpSend;
      showToast('OTP send');
      notifyListeners();
    }

    PhoneCodeAutoRetrievalTimeout? codeAutoRetrievalTimeout(
        String verificationId) {
      verificationID = verificationId;
    }

    try {
      await authServ.auth.verifyPhoneNumber(
        phoneNumber: number,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      print('Error in signing : ${e.toString()}');
    }
  }

  // login with otp
  Future<String?> signInWithPhoneNumber(String otp) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID!,
        smsCode: otp,
      );
      var result = (await authServ.auth.signInWithCredential(credential)).user;
      _status = Status.authenticated;
      notifyListeners();
      return result!.uid;
    } catch (e) {
      showToast(e.toString());
      _status = Status.unauthenticated;
      notifyListeners();
      return null;
    }
  }

  //signing out
  Future signOut() async {
    authServ.auth.signOut();
    _status = Status.unauthenticated;
    notifyListeners();
    return Future.delayed(const Duration(seconds: 2));
  }
}
