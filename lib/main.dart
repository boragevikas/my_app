import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/HomePage/homePage.dart';
import 'package:my_app/controller/SignUpController.dart';
import 'package:my_app/controller/controller.dart';
import 'package:my_app/login/signIn.dart';
import 'package:my_app/login/signUp.dart';
import 'package:my_app/testPages/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(SignUpController());
  Get.put(LoginController());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // home: const homePage(
    //   title: 'HomePage',
    // ),
    home: const login(),
    theme: ThemeData.light().copyWith(primaryColor: Colors.green),
    darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.purple),
    themeMode: ThemeMode.light,
  ));
}
