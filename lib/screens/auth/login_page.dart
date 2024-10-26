import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:app/screens/auth/sign_up_page.dart';
import 'package:app/theme/style.dart';
import 'package:app/widgets/form_container_widget.dart';
import '../../widgets/button_container_widget.dart';
import '../main/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // FirebaseAuth instance
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMeCheckValue = false;

  // Method to handle user login
  Future<void> _loginUser() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the Main Screen if login is successful
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainScreen()),
          (route) => false);
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Allow scrolling
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              const SizedBox(
                height: 140,
              ),
              const Text(
                "Log In",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              // Email or Username Field
              FormContainerWidget(
                hintText: "Email or Username",
                controller: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              // Password Field
              FormContainerWidget(
                hintText: "Password",
                isPassword: true, // This will obscure the password input
                controller: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            _rememberMeCheckValue = value!;
                          });
                        },
                        value: _rememberMeCheckValue,
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const Text(
                    "Forget Password",
                    style: TextStyle(color: primaryColorED6E1B, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Log In Button
              ButtonContainerWidget(
                title: "Log In",
                onTap: _loginUser, // Call the login method here
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("or"),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _optionSignIn(
                    color: redColor,
                    iconData: FontAwesomeIcons.google,
                  ),
                  _optionSignIn(
                    color: Colors.blue[900]!,
                    iconData: FontAwesomeIcons.facebook,
                  ),
                  _optionSignIn(
                    color: Colors.blue[600]!,
                    iconData: FontAwesomeIcons.linkedin,
                  ),
                ],
              ),
              const SizedBox(height: 20), // Add some space before the footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Create account",
                      style: TextStyle(fontSize: 15, color: primaryColorED6E1B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _optionSignIn({required IconData iconData, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Center(
        child: Icon(
          iconData,
          color: whiteColor,
        ),
      ),
    );
  }
}
