import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationModal extends StatelessWidget {
  const VerificationModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 48),
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hi VentriPay Welcome !',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please Verify your Identity to use our',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'payment services',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 24),

              // Skip text button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle verification
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF002D72),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25,),
            ],
          ),
        ),

        Positioned(
          top: -20, // Position it to overlap the top edge
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue[900],
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}



void showVerificationSheet(BuildContext context){
  showModalBottomSheet(context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => const VerificationModal(),
  );
}
