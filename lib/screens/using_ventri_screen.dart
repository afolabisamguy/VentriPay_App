import 'package:flutter/material.dart';

class UsingVentriScreen extends StatelessWidget {
  const UsingVentriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "What do you want to use VentriPay for?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select all use cases that match your want.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 16,),
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
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding: EdgeInsets.symmetric(vertical: 16),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({required IconData icon, required String text}){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 25, color: Colors.blue[900]),
          SizedBox(width: 16,),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          ),
        ],
      ),
    );
  }
}
