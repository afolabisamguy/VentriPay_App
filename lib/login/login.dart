import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../onboarding/basic_information_screen.dart';
import 'enter_email.dart';
import 'enter_phone_number.dart';
// import 'verification_method_provider.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        leadingWidth: 45,
        title: const Text(
          'Back',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(50, 70),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get verification code to log in",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "How would you like to receive a verification code?",
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 180.0),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildOption(
              context,
              ref,
              icon: Icons.phone,
              label: "Phone number",
              method: "Phone",
              route: const EnterPhoneNumber(),
            ),
            Divider(
              color: Colors.grey[300],
              indent: 60,
              endIndent: 30,
            ),
            _buildOption(
              context,
              ref,
              icon: Icons.email,
              label: "Email",
              method: "Email",
              route: const EnterEmail(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BasicInformationScreen()));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                  child: Text(
                    'Sign up here',
                    style: TextStyle(
                        color: Colors.blue[600],
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue[600],
                        decorationThickness: 2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
    BuildContext context,
    WidgetRef ref, {
    required IconData icon,
    required String label,
    required String method,
    required Widget route,
  }) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, size: 28, color: Colors.black),
      ),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: Colors.black,
        // weight: 30,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Selected $method")),
        );
      },
    );
  }
}
