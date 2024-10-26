import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth import
import 'package:app/screens/auth/login_page.dart';
import 'package:app/screens/premium/premium_screen.dart';
import 'package:app/theme/style.dart';
import 'package:app/widgets/button_container_widget.dart';
import 'package:app/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance; // FirebaseAuth instance
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMeCheckValue = false;

  // Method to handle Sign Up
  Future<void> _signUpUser() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the Premium Screen if sign-up is successful
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const PremiumScreen()),
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 129,
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Username Field
                  FormContainerWidget(
                    hintText: "Username",
                    controller: _usernameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Email Field
                  FormContainerWidget(
                    hintText: "Email",
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
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            _rememberMeCheckValue = value!;
                          });
                        },
                        value: _rememberMeCheckValue,
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 2,
                          text: const TextSpan(
                            text: "By signing up you accept the ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Team of service ",
                                style: TextStyle(color: primaryColorED6E1B),
                              ),
                              TextSpan(
                                text: "and ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: primaryColorED6E1B),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Sign Up Button
                  ButtonContainerWidget(
                    title: "Sign Up",
                    onTap: _signUpUser, // Call the sign-up method here
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                          (route) => false);
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontSize: 15, color: primaryColorED6E1B),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
