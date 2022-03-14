import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/controller.dart';
import 'package:my_app/login/signIn.dart';

class homePage extends GetView<LoginController> {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => Get.to(SignIn), child: const Text("Logout")),
          )
        ],
      ),
    );
  }
}
