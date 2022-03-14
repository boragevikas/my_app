import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/SignUpController.dart';
import 'package:my_app/controller/controller.dart';
import 'package:my_app/testPages/loginController.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  SignUpController signUpController = Get.put(SignUpController());

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  SignUpController signUpController = Get.put(SignUpController());
  LoginController controller = Get.put(LoginController());

  final _emailTextController = TextEditingController(text: "");
  final _passwordTextController = TextEditingController(text: "");
  final _upEmailTextController = TextEditingController(text: "");
  final _upPasswordTextController = TextEditingController(text: "");
  final _firstName = TextEditingController(text: "");
  final _lastName = TextEditingController(text: "");
  bool isSignUpScreen = true;
  bool isMale = true;
  bool isRememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 241, 178),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              // width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/my.jpg"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color.fromARGB(255, 3, 133, 240).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to , ",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 181, 187, 8),
                            fontSize: 24,
                          ),
                          children: [
                            TextSpan(
                                text: isSignUpScreen ? " Flutter !" : "Back !",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 181, 187, 8),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignUpScreen
                          ? "SignUp to Continue"
                          : "SignIn to Continue",
                      style: const TextStyle(
                          color: Colors.white, letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          ),
          //shadow effect to bottom circular buttom
          SignInSignUpButton(true),
          //main container for login
          Positioned(
            top: isSignUpScreen ? 165 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.elasticOut,
              padding: const EdgeInsets.all(20),
              height: isSignUpScreen ? 435 : 250,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 15,
                        color: Colors.black38.withOpacity(.3))
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignUpScreen
                                        ? Colors.black
                                        : Colors.grey),
                              ),
                              if (!isSignUpScreen)
                                Container(
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSignUpScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignUpScreen
                                        ? Colors.black
                                        : Colors.grey),
                              ),
                              if (isSignUpScreen)
                                Container(
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignUpScreen) SignUpSection(),
                    if (!isSignUpScreen) SignInSection(),
                  ],
                ),
              ),
            ),
          ),
          //
          SignInSignUpButton(false),
          //bottom part
          BuildBottomButtonWidget(context),
        ],
      ),
    );
  }

  Container SignInSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          BuildTextField(
            Icons.email_outlined,
            "Email",
            false,
            true,
            _emailTextController,
          ),
          BuildTextField(Icons.lock_outline_rounded, "Password", true, false,
              _passwordTextController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.black87,
                      value: isRememberMe,
                      onChanged: (Value) {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      }),
                  const Text(
                    "Remember me",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Container SignUpSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          BuildTextField(Icons.person_outline_outlined, "FirstName", false,
              false, _firstName),
          BuildTextField(Icons.person_outline_outlined, "LastName", false,
              false, _lastName),
          BuildTextField(Icons.email_outlined, "Email", false, true,
              _upEmailTextController),
          BuildTextField(Icons.lock_outlined, "Password", true, false,
              _upPasswordTextController),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: isMale ? Colors.black45 : Colors.white,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(Icons.person),
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: isMale ? Colors.white : Colors.black45,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(Icons.person),
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 250,
            margin: const EdgeInsets.only(top: 20),
            // color: Colors.red,
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                  children: [
                    TextSpan(
                      text: "terms & conditions!",
                      style: TextStyle(
                          color: Color.fromARGB(255, 201, 102, 9),
                          fontSize: 16),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Positioned BuildBottomButtonWidget(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height - 110,
      left: 0,
      right: 0,
      child: Center(
        child: Column(
          children: [
            Text(isSignUpScreen ? "Or Signup With" : "Or SignIn With"),
            Container(
              margin: const EdgeInsets.only(top: 15, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SignInButton(
                    Icons.facebook_outlined,
                    "Facebook",
                    Colors.blueAccent.shade700,
                  ),
                  SignInButton(Icons.g_mobiledata_outlined, "Google",
                      Colors.redAccent.shade700)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedPositioned SignInSignUpButton(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.elasticInOut,
      top: isSignUpScreen ? 555 : 435,
      right: 0,
      left: 0,
      child: Center(
        child: InkWell(
          onTap: () {
            if (!isSignUpScreen) {
              controller.signInWithEmail(context, _emailTextController.text,
                  _passwordTextController.text);
            } else {
              signUpController.signUpWithEmail(context,
                  _upEmailTextController.text, _upPasswordTextController.text);
            }
          },
          child: Container(
            height: 90,
            width: 90,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                        spreadRadius: 5,
                        blurRadius: 15,
                        color: Colors.black38.withOpacity(.3))
                ]),
            child: Center(
              child: !showShadow
                  ? Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 42, 93),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  : const Center(),
            ),
          ),
        ),
      ),
    );
  }

  TextButton SignInButton(IconData icon, String title, Color color) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        primary: Colors.white,
        minimumSize: const Size(145, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    );
  }

  Padding BuildTextField(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
