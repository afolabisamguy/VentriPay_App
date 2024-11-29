import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsingVentriScreen extends StatelessWidget {
  const UsingVentriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Container(
            color: const Color(0XFFEFEFEF),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              "What Do You Want To Use VentriPay For?",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          SizedBox(height: 8,),
          Text(
              "Select All Use Cases That Match Your Want.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            ],
          ),
          ),
          Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
                  children: [
                  _buildOption(
                    icon: Icons.credit_card,
                    text: "Obtain a virtual card for online purchasing",
                  ),
                  _buildOption(
                    icon: Icons.bar_chart,
                    text: "Manage and track my expenses",
                  ),
                  _buildOption(
                    icon: Icons.receipt_long,
                    text: "Generate invoices to accept payments",
                  ),
                  _buildOption(
                    icon: Icons.account_balance,
                    text: "Open an abroad account to receive payments",
                  ),
                  _buildOption(
                    icon: Icons.savings,
                    text: "Save and keep my money in foeign currencies",
                  ),
                  _buildOption(
                    icon: Icons.rocket_launch,
                    text: "Send money abroad",
                  ),
                  _buildOption(
                    icon: Icons.show_chart,
                    text: "Currencies-based Investment",
                  ),
              ],
                ),
            ),
            SizedBox(height: 16,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Color(0XFF003366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            const SizedBox(height: 36,),
          ],
        ),
      ),
          ),
    ],
    ),
    );
  }

  Widget _buildOption({required IconData icon, required String text}){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0XFFCCD6E0),
        borderRadius: BorderRadius.circular(8),

      ),
      child: Row(
        children: [
          Icon(icon, size: 25, color: Colors.blue[900]),
          SizedBox(width: 16,),
          Expanded(child: Text(text, style: GoogleFonts.redHatDisplay(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w500),
          ),
          ),
        ],
      ),
    );
  }
}
