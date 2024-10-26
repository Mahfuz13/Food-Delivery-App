import 'package:flutter/material.dart';
import 'package:app/screens/onboarding/onboarding_screen.dart';
import 'package:app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAMx8fvwV-hDdKSqyBTtk6TWoGh67K5eQU",
      authDomain: "fdelivery-app.firebaseapp.com",
      projectId: "fdelivery-app",
      storageBucket: "fdelivery-app.appspot.com",
      messagingSenderId: "156749753436",
      appId: "1:156749753436:web:487d2cd3133dacaebfca99",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primarySwatch = MaterialColor(
      0xFFED6E1B,
      <int, Color>{
        50: Color(0xFFED6E1B),
        100: Color(0xFFED6E1B),
        200: Color(0xFFED6E1B),
        300: Color(0xFFED6E1B),
        400: Color(0xFFED6E1B),
        500: Color(0xFFED6E1B),
        600: Color(0xFFED6E1B),
        700: Color(0xFFED6E1B),
        800: Color(0xFFED6E1B),
        900: Color(0xFFED6E1B),
      },
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Food Prime",
        theme: ThemeData(
          primarySwatch: primarySwatch,
        ),
        home: const SplashScreen(child: OnBoardingScreen()));
  }
}
