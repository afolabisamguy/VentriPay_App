import 'package:flutter/material.dart';
import 'package:new_ventripay/screens/create_password_screen.dart';
import 'package:new_ventripay/screens/login/login.dart';

class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _fullName;
  String? _email;
  String? _phoneNumber;
  String? _gender;
  String? _selectedCountryCode = "+234";
  final List<String> _genders = ["Male", "Female", "Other"];
  final List<String> _countryCodes = ["+234", "+1", "+44", "+91", "+81"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Basic Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                "Full Name (as it appears on your official ID)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Full Name",
                ),
                onChanged: (value) {
                  setState(() {
                    _fullName = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "Gender",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: _gender,
                items: _genders
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                hint: const Text("Gender"),
              ),
              const SizedBox(height: 16),
              const Text(
                "Email",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Email Address",
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "Enter Phone Number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedCountryCode,
                      items: _countryCodes
                          .map((code) => DropdownMenuItem(
                                value: code,
                                child: Text(code),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCountryCode = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "00 0000 0000",
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        setState(() {
                          _phoneNumber = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _isFormValid() ? _submitForm : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Continue"),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    "Alrady have an account? Sign in here",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _fullName?.isNotEmpty == true &&
        _email?.isNotEmpty == true &&
        _phoneNumber?.isNotEmpty == true &&
        _gender?.isNotEmpty == true;
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      // Handle form submission logic
      print(
          "Form submitted with values: $_fullName, $_gender, $_email, $_phoneNumber");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CreatePasswordScreen()));
    }
  }
}
