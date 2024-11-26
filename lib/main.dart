import 'package:flutter/material.dart';
import 'package:new_ventripay/screens/basic_information_screen.dart';
import 'package:new_ventripay/screens/country_screen.dart';
import 'package:new_ventripay/screens/create_password_screen.dart';
import 'package:new_ventripay/screens/otp_verification_screen.dart';
import 'package:new_ventripay/screens/using_ventri_screen.dart';
import 'package:new_ventripay/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen()
    );
  }
}
