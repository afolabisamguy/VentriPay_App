import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_ventripay/screens/using_ventri_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());
  bool _isVerifyButtonEnabled = false;
  late Timer _timer;
  int _timeRemaining = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer(){
    _timeRemaining = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _validateOtpFields() {
    setState(() {
      _isVerifyButtonEnabled = _otpControllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Verify Your Email",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {

        },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            const Text(
              "Please Enter the OTP sent to",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4,),
            const Text(
              "VentriPay@gmail.com",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) => SizedBox(
                width: 50,
                  child: TextField(
                    controller: _otpControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5){
                        FocusScope.of(context).nextFocus();
                      }
                      _validateOtpFields();
                    },
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                  ),
              ),
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              _timeRemaining > 0
                  ? "00:${_timeRemaining.toString().padLeft(2, "0")}"
                  : "Time Elapsed(The OTP has Expired! Please Request For A New One)",
              style: TextStyle(
                color: _timeRemaining > 0 ? Colors.black : Colors.red,
                fontSize: _timeRemaining > 0 ? 16 : 10,
                fontWeight: _timeRemaining > 0 ?FontWeight.bold : FontWeight.w500,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isVerifyButtonEnabled ? Colors.blue : Colors.grey,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
              ),
              onPressed: _isVerifyButtonEnabled ? () {
                print("Otp Verified!");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UsingVentriScreen()));
              } : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 8,),
                  Text("Verify Account", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            const SizedBox(height: 8,),
            InkWell(
              onTap: () {

              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                Icon(Icons.refresh, size: 20,),
                SizedBox(width: 8,),
                Text(
                "Resend Code",
                style: TextStyle(fontSize: 12 )
              ),
              ],
            ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
