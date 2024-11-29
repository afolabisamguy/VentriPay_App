import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_ventripay/base/dashboard__header.dart';
import 'package:new_ventripay/screens/verification_modal.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 40,),
            const DashboardHeader(title: "Dashboard",
            notificationCount: 3,),
            Padding(
              padding: const EdgeInsets.only(top:12.0, left:12.0, right:12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0XFF003366),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            "https://via.placeholder.com/50",
                          ),
                        ),
                        SizedBox(width: 12,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning, VentriPay",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "Last Login: 10/10/2024 18:10",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFFE0E7ED), // Matches background color
                          borderRadius: BorderRadius.circular(10), // Smooth border radius
                        ),
                        width: 320, // Adjusted width for alignment
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top Row with 'Available Balance' and 'Transaction History'
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.shield, size: 14, color: Colors.black54), // Shield icon
                                    SizedBox(width: 4),
                                    Text(
                                      "Available Balance",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.visibility, size: 14, color: Colors.black54), // Eye icon
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Transaction History",
                                      style: TextStyle(
                                        color: Color(0xFF003366),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.arrow_forward_ios, size: 12, color: Color(0xFF003366)), // Arrow icon
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12), // Spacing
                            // Balance Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // NGN Section
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start, // Align to start
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          "http://flagcdn.com/w40/ng.png",
                                          width: 16,
                                          height: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "NGN",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "₦430.89",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                // Vertical Line
                                Container(
                                  width: 1, // Thinner line
                                  height: 40, // Slightly taller line
                                  color: Colors.black26, // Vertical line color
                                ),
                                // USD Section
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start, // Align to start
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          "http://flagcdn.com/w40/us.png",
                                          width: 16,
                                          height: 16,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          "USD",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_drop_down, size: 16, color: Colors.black54), // Dropdown icon
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "\$0.00",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0XFFF2F2F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ID VERIFICATION",
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        Text(
                          "Verify Your ID To Finish",
                          style: GoogleFonts.redHatDisplay(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          "Setting Up Your Account",
                          style: GoogleFonts.redHatDisplay(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => showVerificationSheet(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF003366),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      child: const Text(
                        "Begin→",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0XFFF2F2F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 1),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        height: 50,
                        width: 270,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Row(
                            children: [
                              Image.network(
                                "http://flagcdn.com/w40/us.png",
                                width: 24,
                                height: 16,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.flag,
                                  size: 16,
                                ),
                              ),
                              const SizedBox(width: 8,),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "USD - ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: "US Dollar",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "\$0",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.visibility))
                      ],
                    ),
                    const SizedBox(height: 8,),
                    GestureDetector(
                      onTap: () {
                        // Handle tap on "Get Your US Bank Account"
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        ),
                        width: 270,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_balance, color: Colors.blueAccent),
                                SizedBox(width: 8),
                                Text(
                                  "Get Your US Bank Account",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward, color: Colors.black45),
                          ],
                        ),
                      ),
                    ),
            const SizedBox(height: 16,),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickAction("Add", Icons.add),
                  _buildQuickAction("Convert", Icons.currency_exchange),
                  _buildQuickAction("Send", Icons.send),
                ],
            ),
                  ],
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFF2F2F2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    _buildService("Airtime", Icons.phone),
                    _buildService("Data", Icons.data_usage),
                    _buildService("Virtual CArds", Icons.credit_card),
                    _buildService("Gift Cards", Icons.card_giftcard),
                    _buildService("Betting", Icons.sports_esports),
                    _buildService("Loan", Icons.attach_money),
                    _buildService("Pay Bill", Icons.receipt),
                    _buildService("Invoice", Icons.insert_drive_file),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),
          ],
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Card"),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), label: "Frequent Transactions"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        selectedItemColor: const Color(0XFF003366),
      ),
    );
  }

  Widget _buildQuickAction(String label, IconData icon){
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0XFFCCD6E0),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 4,),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildService(String label, IconData icon){
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0XFFCCD6E0),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height:4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 10, color: Colors.black54),
          ),
      ],
    );
  }
}
