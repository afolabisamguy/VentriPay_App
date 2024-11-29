import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_ventripay/screens/otp_verification_screen.dart';

import '../base/header_widget.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordsMatch = true;
  bool _isContinueEnabled = false;
  bool _isPasswordVisible = false;
  bool _isContinueEnabled1 = false;
  bool _is1stChecked = true;
  bool _is2ndChecked = false;


  void _validatePasswords(){
    setState(() {
      _passwordsMatch = _passwordController.text == _confirmPasswordController.text;
      _isContinueEnabled = _passwordsMatch && _passwordController.text.isNotEmpty;
    });
  }

  void _shouldContinue(){
    setState(() {
      _isContinueEnabled1 = _isContinueEnabled && _is2ndChecked && _is1stChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            const HeaderWidget(showBackButton: true, text: "Create Password"),
            const SizedBox(height: 20,),
            Text(
              "Enter Password",
              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8,),
            _buildPasswordField("Enter Password", _passwordController, true),
            const SizedBox(height: 20,),
            Text(
              "Confirm Password",
              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8,),
            _buildPasswordField("Confirm Password", _confirmPasswordController, false),
            if (!_passwordsMatch)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Password do not match",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            const Spacer(),
            _buildCheckboxSection(),
            const SizedBox(height: 20,),
            _buildContinueButton(),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      String label, TextEditingController controller, bool isPasswordField){
    return TextField(
      controller: controller,
      obscureText: !_isPasswordVisible,
      onChanged: (value) {
        _validatePasswords();
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
        },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildCheckboxSection(){
    return Column(
      children: [
        Row(
          children: [
            Checkbox(value: _is1stChecked,
              onChanged: (value){
              setState(() {
                _is1stChecked = value!;
                _shouldContinue();
              });
            },
            ),
            const Expanded(child: Text(
              "I agree to recieving email updates about new products,"
                  "announcements, and special deals.",
              style: TextStyle(fontSize: 14),
            ),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _is2ndChecked,
              onChanged: (value){
                setState(() {
                _is2ndChecked = value!;
                _shouldContinue();
                });
                },
            ),
            const Expanded(
                child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                text: "I agree to the ",
                style: TextStyle(fontSize:14),
              ),
              TextSpan(
                text: "Terms of Use",
                style: TextStyle(fontSize:14,
                decoration: TextDecoration.underline,
                color: Colors.blue),
              ),
              TextSpan(
                text: " and ",
                style: TextStyle(fontSize:14),
              ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(fontSize:14,
                    decoration: TextDecoration.underline,
                    color: Colors.blue),
                  ),
                  ],
            ),
    ),
    ),
          ],
        ),
      ],
    );
  }


  Widget _buildContinueButton(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _isContinueEnabled1 ? Color(0XFF003366) : Colors.grey,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: _isContinueEnabled1
      ? () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OtpVerificationScreen()));
      } : null,
      child: const Text("Continue", style: TextStyle(color: Colors.white),),
    );
  }
}
