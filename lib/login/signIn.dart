import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/controller.dart';
import 'package:my_app/login/signUp.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
//Getx will find your controller.
  LoginController controller = Get.put(LoginController());
  final _emailTextController = TextEditingController(text: "");
  final _passwordTextController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple[300],
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height * 0.97,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 70,
                  ),

                  Container(
                    height: 50,
                    width: 50,
                    child: const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd-rB1So-F12GjOvdduzIy6VVpL4J0JpJFmQmYtAAf5f13t67kND3jJPos0p-KJxa7NII&usqp=CAU',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  // Container(child: const Icon(Icons.person)),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "WELCOME!",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // color: Colors.white,
                        letterSpacing: 1.2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Text("SIGN IN TO CONTINUE!",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black45,
                          letterSpacing: 1.2)),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Enter Email',
                                labelText: 'Email',
                                prefixIcon: const Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordTextController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.pinkAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(Icons.vpn_key),
                                // suffixIcon: IconButton(
                                //   // icon: Icon(
                                //   //   obscureText
                                //   //       ? Icons.visibility
                                //   //       : Icons.visibility_off,
                                //   // ),
                                //   onPressed: (){}
                                // ),
                                hintText: 'Enter Password',
                                labelText: 'Password',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   child: const Text("Login"),
                            // ),
                            Container(
                              // color: Colors.red,
                              height: 30,
                              alignment: Alignment.centerRight,
                              child: const Text(
                                "Forget Password?",
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () => controller.signInWithEmail(
                                    context,
                                    _emailTextController.text,
                                    _passwordTextController.text),
                                child: Container(
                                  child: const Center(
                                    child: Text("SIGN IN ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.black26,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // const Text("Or"),
                      const Text(" Sign In With Google! "),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 20,
                              width: 20,
                              child: const CircleAvatar(
                                radius: 30.0,
                                backgroundImage: NetworkImage(
                                  'https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg',
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Does not have account? "),
                      const SizedBox(
                        height: 10,
                      ),

                      InkWell(
                        onTap: () => Get.to(SignUp()),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // color: Colors.black,
                          child: const Center(
                            child: Text(
                              "SIGN UP!",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 260,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
