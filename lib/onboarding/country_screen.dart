import 'package:flutter/material.dart';
import 'package:new_ventripay/base/footer_widget.dart';
import 'package:new_ventripay/base/header_widget.dart';
import 'package:new_ventripay/screens/basic_information_screen.dart';

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
                  SizedBox(height: 8),
                  HeaderWidget(showBackButton: true, text: "What Country Do You Live In"),
                  SizedBox(height: 20),
                  Text(
                    "Country",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: toggleDropdown,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedCountry,
                            style: TextStyle(fontSize: 16),
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
                          SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Search for country",
                              prefixIcon: Icon(Icons.search),
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
                          SizedBox(height: 8),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const BasicInformationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF003366),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  const FooterWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
