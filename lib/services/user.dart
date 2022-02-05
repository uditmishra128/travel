import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rideapp/models/user.dart';
import 'package:rideapp/provider/user.dart';
import 'package:rideapp/utils/locator.dart';
import 'package:rideapp/utils/toast.dart';

class UserService {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  // create user in firestore
  Future<Error?> registerUser(
      String name, String gender, BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String? phone;
    String? uid;
    await authServ.currentFirebaseUser().then((result) {
      if (result != null) {
        phone = result.phoneNumber;
        uid = result.uid;
      }
    }).catchError((err) {
      showToast('Error : ${err.toString()}');
    });
    Users currentUser = Users(
        id: uid,
        phone: phone,
        name: name,
        gender: gender,
        email: userProvider.authUser?.email,
        accesstoken: userProvider.authUser?.accesstoken,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    try {
      await userRef.doc(uid).set(currentUser.toJson(), SetOptions(merge: true));
      return null;
    } on Error catch (e) {
      showToast('Error : ${e.toString()}');
      return e;
    }
  }

  // get current user
  Future<Users?> getCurrentUser() async {
    Users? user;
    String? uid;
    await authServ.currentFirebaseUser().then((result) {
      if (result != null) {
        uid = result.uid;
      }
    }).catchError((err) {
      showToast('Error : ${err.toString()}');
    });
    try {
      var snap = await userRef.doc(uid).get();
      if (snap.exists) {
        user = Users.fromJson(snap.data() as Map<String, dynamic>);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      showToast('Error : ${e.toString()}');
      return null;
    }
  }
}
