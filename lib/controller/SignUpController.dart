import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/HomePage/homePage.dart';
import 'package:my_app/core/enum/firebase_auth_results.dart';
import 'package:my_app/core/model/user.dart';
import 'package:my_app/core/shared_preference_helper.dart';
import 'package:my_app/login/signUp.dart';
import 'package:my_app/services/firebase_services/firebase_exceptions.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _firebaseUser() => _auth.currentUser;
  FirebaseAuth? auth() => _auth;
  User user() => _firebaseUser()!;
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();
  final CollectionReference _userCollectionRefrence =
      FirebaseFirestore.instance.collection("Users");

  String _email = '';
  String get email => _email;
  setEmail(String value) {
    _email = value;
  }

  String _firstName = '';
  String get firstName => _firstName;
  setFirstName(String value) {
    _firstName = value;
  }

  String _lastName = '';
  String get lastName => _lastName;
  setLastName(String value) {
    _lastName = value;
  }

  String _password = '';
  String get password => _password;
  setPassword(String value) {
    _password = value;
  }

  String _errorType(var authResult) {
    switch (authResult) {
      case FirebaseAuthResults.NetworkError:
        return "Please check your connection and try again";
      case FirebaseAuthResults.PasswordNotValid:
        return "Check your password and try again";
      case FirebaseAuthResults.Success:
        return "";
      case FirebaseAuthResults.TooManyAttempts:
        return "Please try again after some time, too many login request";
      case FirebaseAuthResults.UserNotFound:
        return "Email not registered yet";
      case FirebaseAuthResults.Unknown:
        return "Unknown error, please try again";
      default:
        return "Unknown error, please try again";
    }
  }

  Future signUp(BuildContext context, String emailId, String password) async {
    try {
      await auth()!
          .createUserWithEmailAndPassword(email: emailId, password: password);
      if (user() != null) {
        await _sharedPreferencesHelper.setLoggedInUserId(user().uid);
        await _sharedPreferencesHelper.setPassword(password);
        return FirebaseAuthResults.Success;
      } else {
        return FirebaseAuthResults.Unknown;
      }
    } catch (e) {
      return FirebaseAuthExceptions.catchException(e);
    }
  }

  signUpWithEmail(
    BuildContext context,
    String email,
    String password,
  ) async {
    FirebaseAuthResults authResult = await signUp(
      context,
      email,
      password,
    );

    if (authResult == FirebaseAuthResults.Success) {
      await createUser(context);
      var snackBar = SnackBar(
        content: const Text('SignUp Successful'),
        backgroundColor: Colors.greenAccent[700],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Get.to(() => const homePage());
    } else {
      var snackBar = SnackBar(
        content: Text('Error: ${_errorType(authResult)}'),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  createUser(BuildContext context) async {
    AppUser appUser = AppUser(
      //  uid: uid,
      createdAt: DateTime.now(),
      firstName: _firstName,
      lastName: _lastName,
      email: _email,
      password: _password,
    );
    Map<String, dynamic> user = appUser.toMap();
    try {
      await _userCollectionRefrence.doc(appUser.email).set(user);
    } catch (e) {
      print(e);
    }
  }
}
