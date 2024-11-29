import 'package:flutter/material.dart';
import 'package:new_ventripay/idverification/date_of_birth_screen.dart';
import 'package:new_ventripay/idverification/id_scan_screen.dart';
import 'package:new_ventripay/idverification/name_and_gender.dart';
import 'package:new_ventripay/idverification/take_selfie_screen.dart';
import 'package:new_ventripay/onboarding/basic_information_screen.dart';
import 'package:new_ventripay/onboarding/country_screen.dart';
import 'package:new_ventripay/onboarding/create_password_screen.dart';
import 'package:new_ventripay/idverification/dashboard_screen.dart';
import 'package:new_ventripay/onboarding/otp_verification_screen.dart';
import 'package:new_ventripay/onboarding/using_ventri_screen.dart';
import 'package:new_ventripay/onboarding/welcome_screen.dart';

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
      home: TakeSelfieScreen()
    );
  }
}
