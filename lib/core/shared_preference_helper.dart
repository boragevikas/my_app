import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  late SharedPreferences? _sharedPreferences;
  final String? _userType = 'userType';
  final String? _loggedInUserId = '_loggedInUserId';
  final String? _userEmailId = '_userEmailId';
  final String? _userName = '_userName';
  final String? _password = '_password';
  final String? _deviceId = '_deviceId';
  final bool? _isDownloaded = false;
  final String? _commonPath = '_commonPath';

  SharedPreferencesHelper() {
    _init();
  }

  _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Method that saves the _loggedInUserId
  Future<bool> setLoggedInUserId(String id) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_loggedInUserId!, id);
    debugPrint('User Id Saved' + res.toString());
    return res;
  }

  //Method that return the _loggedInUserId
  Future<String?> getLoggedInUserId() async {
    await _init();
    String? res = _sharedPreferences!.getString(_loggedInUserId!);
    debugPrint('User Id Retrived' + res.toString());
    return res;
  }

  Future<bool> setPath(String id) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_commonPath!, id);
    debugPrint('path Saved' + res.toString());
    return res;
  }

  //Method that return the _loggedInUserId
  Future<String?> getPath() async {
    await _init();
    String? res = _sharedPreferences!.getString(_commonPath!);
    debugPrint('path Retrived' + res.toString());
    return res;
  }

  Future<bool> setIsDownloaded(bool downloaded) async {
    await _init();
    bool res = await _sharedPreferences!.setBool("_isDownloaded", downloaded);
    debugPrint('IsDownloaded Saved' + res.toString());
    return res;
  }

  //Method that return the _loggedInUserId
  Future<bool?> getIsDownloaded() async {
    await _init();
    bool? res = _sharedPreferences!.getBool("_isDownloaded");
    debugPrint('isDownloaded Retrived' + res.toString());
    return res;
  }

  //Method that saves the user name
  Future<bool> setUserName(String name) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_userName!, name);
    debugPrint('User name Saved' + res.toString());
    return res;
  }

  Future<String> getUserName() async {
    await _init();
    String username = _sharedPreferences!.getString(_userName!) ?? "";
    debugPrint('User name Returned=' + username);
    return username;
  }

  Future<bool> setDeviceId(String id) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_deviceId!, id);
    debugPrint('User device id Saved' + res.toString());
    return res;
  }

  Future<String> getDeviceId() async {
    await _init();
    String deviceId = _sharedPreferences!.getString(_deviceId!) ?? "";
    debugPrint('User device Id Returned=' + deviceId);
    return deviceId;
  }

  Future<bool> setPassword(String password) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_password!, password);
    debugPrint('Password Saved' + res.toString());
    return res;
  }

  Future<String> getPassword() async {
    await _init();
    String password = _sharedPreferences!.getString(_password!) ?? "";
    debugPrint('Password Returned=' + password);
    return password;
  }

  bool isUserLoggedIn() {
    return _sharedPreferences!.containsKey(_loggedInUserId!);
  }

  //Method that saves the user logged in type
  // Future<bool> setUserType(UserType userType) async {
  //   await _init();
  //   bool res = await _sharedPreferences!.setString(_userType!, userType.code);
  //   debugPrint('User Type Saved' + userType.code + ' ' + res.toString());
  //   return res;
  // }

  //Method that return the user logged in type
  // Future<UserType> getUserType() async {
  //   await _init();
  //   String userType =
  //       _sharedPreferences!.getString(_userType!) ?? UserType.SUBSCRIBER.code;
  //   debugPrint('User Type Returned' + userType);
  //   return userType.userTypeValue;
  // }

  // Method that retrive the branch of loggedin user
  Future<String> getUserEmailId() async {
    await _init();
    String res = _sharedPreferences!.getString(_userEmailId!) ?? "";
    debugPrint('emailid Retrived : ' + res);
    return res.toLowerCase();
  }

  // Method that saves the branch of loggedIn User
  Future<bool> setUserEmailId(String userEmailId) async {
    await _init();
    bool res = await _sharedPreferences!.setString(_userEmailId!, userEmailId);

    debugPrint('email id Saved : ' + res.toString());

    return res;
  }

  //Method to remove all the Sharedpreference details when Logging Out
  Future<bool> clearAllData() async {
    await _init();
    //bool res = await _sharedPreferences!.clear();
    await _sharedPreferences!.remove(_userType!);
    await _sharedPreferences!.remove(_loggedInUserId!);
    await _sharedPreferences!.remove(_userEmailId!);
    await _sharedPreferences!.remove(_userName!);
    await _sharedPreferences!.remove(_password!);
    debugPrint('All Data Cleared : ');

    return true;
  }
}
