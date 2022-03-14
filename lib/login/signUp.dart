import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/HomePage/homePage.dart';
import 'package:my_app/controller/SignUpController.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
//Getx will find your controller.
  SignUpController controller = Get.put(SignUpController());

  final _emailTextController = TextEditingController(text: "");
  final _passwordTextController = TextEditingController(text: "");
  final _firstName = TextEditingController(text: "");
  final _lastName = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple[300],
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Icon(Icons.person),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text("Please Fill this form to create an account!"),
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        onChanged: (value) => controller.setFirstName(value),
                        controller: _firstName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          labelText: 'First Name',
                          hintText: ' Enter your First name',
                          prefixIcon: const Icon(Icons.person),
                          // suffixIcon: Icon(Icons.keyboard_arrow_down),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) => controller.setLastName(value),
                        controller: _lastName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          labelText: 'Last Name',
                          hintText: ' Enter your Last Name',
                          prefixIcon: const Icon(Icons.person),
                          // suffixIcon: Icon(Icons.keyboard_arrow_down),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          controller.setEmail(value);
                        },
                        controller: _emailTextController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email!);
                          if (emailValid) {
                            return null;
                          } else {
                            return "please enter valid email";
                          }
                        },
                        // validator: (email)=>email != null && !EmailValidator.validate(email)
                        // ? 'Enter a vaild email'
                        // : null,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          labelText: 'Email',
                          hintText: ' Enter your valid Email',
                          prefixIcon: const Icon(Icons.email),
                          // suffixIcon: Icon(Icons.keyboard_arrow_down),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (value) => controller.setPassword(value),
                        controller: _passwordTextController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Set Password',
                          hintText: ' Password',
                          prefixIcon: const Icon(Icons.vpn_key_sharp),
                          // suffixIcon: const Icon(Icons.visibility),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: ' Password',
                          hintText: ' Confirm Password',
                          prefixIcon: const Icon(Icons.vpn_key),
                          // suffixIcon: IconButton(
                          //   onPressed: () {},
                          //   icon: Icon(obscureText
                          //       ? Icons.visibility
                          //       : Icons.visibility_off),
                          // ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          // IconButton(
                          //     onPressed: () {},
                          // icon: Icon(checkBox
                          //     ? Icons.check_box
                          //     : Icons.check_box_outline_blank_outlined)),
                          Text("   I have accept the Terms and Conditions!"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => controller.signUpWithEmail(
                            context,
                            _emailTextController.text,
                            _passwordTextController.text,
                          ),
                          child: Container(
                            child: const Center(
                              child: Text("SIGN UP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              border: Border.all(
                                color: Colors.black26,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
