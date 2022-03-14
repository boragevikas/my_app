import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/HomePage/homePage.dart';
import 'package:my_app/core/enum/firebase_auth_results.dart';
import 'package:my_app/core/shared_preference_helper.dart';
import 'package:my_app/login/signUp.dart';
import 'package:my_app/services/firebase_services/firebase_exceptions.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _firebaseUser() => _auth.currentUser;
  FirebaseAuth? auth() => _auth;
  User user() => _firebaseUser()!;
  final SharedPreferencesHelper _sharedPreferencesHelper =
      SharedPreferencesHelper();
  String emailId = "";
  String password = "";

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

  Future<FirebaseAuthResults> signIn(
      BuildContext context, String emailId, String password) async {
    try {
      await auth()!
          .signInWithEmailAndPassword(email: emailId, password: password);
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

  signInWithEmail(BuildContext context, String email, String password) async {
    FirebaseAuthResults authResult = await signIn(context, email, password);

    if (authResult == FirebaseAuthResults.Success) {
      var snackBar = SnackBar(
        content: const Text('Welcome'),
        backgroundColor: Colors.greenAccent[700],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Get.showSnackbar(snackbar);
      Get.to(() => const homePage());
    } else {
      var snackBar = SnackBar(
        content: Text('Error: ${_errorType(authResult)}'),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
