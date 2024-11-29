import 'package:flutter/material.dart';
import 'package:new_ventripay/onboarding/footer_widget.dart';
import 'package:new_ventripay/onboarding/header_widget.dart';
import 'package:new_ventripay/onboarding/basic_information_screen.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  String selectedCountry = "United States";
  List<String> countries = [
    "United States",
    "Algeria",
    "Angola",
    "Argentina",
    "Austria",
    "Belgium",
    "Benin",
    "Brazil",
    "Bulgaria",
    "Cameroon",
    "Canada",
  ];
  List<String> filteredCountries = [];
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Section: Back Button and Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const HeaderWidget(
                      showBackButton: true,
                      text: "What Country Do You Live In"),
                  const SizedBox(height: 20),
                  const Text(
                    "Country",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: toggleDropdown,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCountry,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Icon(
                            isDropdownOpen
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Section: Dropdown Content or Empty Spacer
            Expanded(
              child: isDropdownOpen
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Search for country",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                filteredCountries = countries
                                    .where((country) => country
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: filteredCountries.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(filteredCountries[index]),
                                  onTap: () {
                                    setState(() {
                                      selectedCountry =
                                          filteredCountries[index];
                                      isDropdownOpen = false; // Close dropdown
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ),

            // Bottom Section: Fixed Continue Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BasicInformationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003366),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  const FooterWidget(),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    child: const Text(
                      "Already have an account? Sign in here",
                      style: TextStyle(color: Color(0xFF003366)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
