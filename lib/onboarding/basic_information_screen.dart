import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_ventripay/base/footer_widget.dart';
import 'package:new_ventripay/screens/create_password_screen.dart';

import '../base/header_widget.dart';

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
  final Map<String, String> _countryFlags = {
    "+234": "ng",
    "+44": "gb",
    "+1": "us",
    "+91": "in",
    "+81": "jp"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        const SizedBox(height: 35,),
        const HeaderWidget(showBackButton: true, text: "Basic Information"),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name (as it appears on your official ID)",
                style: GoogleFonts.redHatDisplay(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Full Name",
                ),
                onChanged: (value) {
                  setState(() {
                    _fullName = value;
                  });
                },
              ),
              const SizedBox(height:16),
              Text(
                "Gender",
                style: GoogleFonts.redHatDisplay(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height:8),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              Text(
                "Email",
                style: GoogleFonts.redHatDisplay(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              Text(
                "Enter Phone Number",
                style: GoogleFonts.redHatDisplay(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height:8),
              Row(
                children: [
                  Container(
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedCountryCode,
                      items: _countryCodes.map((code) {
                        final countryCode = _countryFlags[code]?.toLowerCase();
                        return DropdownMenuItem(
                          value: code,
                          child: Row(
                            children: [
                              Image.network(
                                "http://flagcdn.com/w40/$countryCode.png",
                                width: 24,
                                height: 16,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.flag,
                                      size: 16,
                                    ),
                              ),
                              const SizedBox(width: 8),
                              Text(code),
                            ],
                          ),
                        );
                      })
                        .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCountryCode = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              Spacer(),
              ElevatedButton(
                onPressed: _isFormValid() ? _submitForm: null,
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Color(0XFFCCD6E0),
                  backgroundColor: Color(0XFF003366),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                child: const Text("Continue",
                  style: TextStyle(color: Colors.white)
                  ,),
              ),
              SizedBox(height: 16,),
              const FooterWidget()
            ],
          ),
        ),
      ),
        ),
        ],
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
    if (_formKey.currentState?.validate() == true){
      // Handle form submission logic
      print("Form submitted with values: $_fullName, $_gender, $_email, $_phoneNumber");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreatePasswordScreen()));
    }
  }
}
