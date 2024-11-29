import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(color: Colors.black), // Default text style
          children: [
            TextSpan(
              text: "Sign in here",
              style: const TextStyle(
                color: Colors.blue, // Blue color
                decoration: TextDecoration.underline, // Underlined
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle the tap event
                  print("Sign in clicked!");
                },
            ),
          ],
        ),
      ),
    );
  }
}
