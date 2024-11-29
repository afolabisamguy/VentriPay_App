import 'package:flutter/material.dart';
import 'package:new_ventripay/idverification/id_header_widget.dart';

class NameAndGender extends StatefulWidget {
  const NameAndGender({super.key});

  @override
  State<NameAndGender> createState() => _NameAndGenderState();
}

class _NameAndGenderState extends State<NameAndGender> {
  final TextEditingController _fullNameController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25.0,),
          const IdHeaderWidget(percentage: 15.0),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0,),
              const Text(
                "Full Name (as it appears on your official ID)",
                style: TextStyle(
                  fontSize: 14.0, fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 8.0,),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: "Enter your full name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
              ),
              const SizedBox(height:24.0),
              const Text(
                "Gender",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 8.0,),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                hint: const Text("Gender"),
                value: _selectedGender,
                items: ["Male", "Female", "Other"].map((gender) =>
                DropdownMenuItem(value: gender,child: Text(gender),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                  )
            ],
          ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
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
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}
