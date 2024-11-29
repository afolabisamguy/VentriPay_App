import 'package:flutter/material.dart';
import 'package:new_ventripay/onboarding/basic_information_screen.dart';
import 'package:new_ventripay/onboarding/country_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "title": "WELCOME TO VENTRIPAY!",
      "description":
          "Effortlessly send money across Africa and beyond, with security and speed you can trust.",
      "image": "assets/images/Onboarding1.png"
    },
    {
      "title": "Seamless Payments, Anytime, Anywhere",
      "description":
          "Whether it’s paying bills, creating virtual cards, or sending money, VentriPay makes it fast and easy.",
      "image": "assets/images/Onboarding2.png"
    },
    {
      "title": "Your Trusted Partner in Secure Transactions",
      "description":
          "Join VentriPay today and experience affordable, transparent, and reliable financial services for all your needs.",
      "image": "assets/images/Onboarding3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 20).add(EdgeInsets.all(16)),
              // Adds 20 for top and 16 for all sides
              child: TextButton(
                onPressed: () {
                  // Define the action when the button is pressed
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadowColor: Colors.black12,
                  elevation: 2,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  // Ensures the row doesn't take up more space than needed
                  children: [
                    Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8), // Adds space between text and icon
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  title: onboardingData[index]["title"]!,
                  description: onboardingData[index]["description"]!,
                  imageUrl: onboardingData[index]["image"]!,
                  availableHeight:
                      screenHeight * 0.8, // Adjust space dynamically
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: onboardingData.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Color(0xFF003366),
              dotColor: Colors.grey,
              expansionFactor: 3,
            ),
          ),
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            // Adds horizontal padding
            child: ElevatedButton(
              onPressed: () {
                if (_pageController.page!.toInt() < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const CountryScreen()));
                }
              },
              child: Text("NEXT", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003366),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double availableHeight;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.availableHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD9E8F7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  width: availableHeight * 0.4,
                  height: availableHeight * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
