import 'package:flutter/foundation.dart';
import 'package:my_app/core/enum/firebase_auth_results.dart';

class FirebaseAuthExceptions {
  static FirebaseAuthResults catchException(var e) {
    debugPrint(e.toString());
    FirebaseAuthResults errorType = FirebaseAuthResults.Unknown;
    switch (e.message) {
      case "1":
      case 'Error 17011':
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        errorType = FirebaseAuthResults.UserNotFound;
        break;
      case 'Error 17009':
      case 'ERROR_WRONG_PASSWORD':
      case 'The password is invalid or the user does not have a password.':
        errorType = FirebaseAuthResults.PasswordNotValid;
        break;
      case 'Error 17020':
      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        errorType = FirebaseAuthResults.NetworkError;
        break;
      case 'Too many unsuccessful login attempts.  Please include reCaptcha verification or try again later':
        errorType = FirebaseAuthResults.TooManyAttempts;
        break;
      // ...
      default:
        debugPrint('The Error ${e.message} is not yet implemented');
    }

    debugPrint('The error is $errorType');
    return errorType;
  }
}
