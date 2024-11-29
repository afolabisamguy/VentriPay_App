import 'dart:math';

import 'package:flutter/material.dart';
import 'package:new_ventripay/idverification/id_header_widget.dart';

class IdScanScreen extends StatefulWidget {
  const IdScanScreen({super.key});

  @override
  State<IdScanScreen> createState() => _IdScanScreenState();
}

class _IdScanScreenState extends State<IdScanScreen> {

  bool isScanned = false;

  void scanID(){
    setState(() {
      isScanned = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30,),
          const IdHeaderWidget(percentage: 50.0),
          const SizedBox(height: 16.0),
          Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Front Of Your ID",
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isScanned ? Color(0XFF003366) : Colors.white,
                    width: 3.5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[300],
                ),
                child: !isScanned ?
                  CustomPaint(
                  painter: DashedBorderPainter(),
              ) : null,
              ),
                SizedBox(height: 16,),
                if (isScanned)
                  Container(
                    width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0XFF003366),
                        ),
                        child: Icon(Icons.check,
                        size: 25,
                        color: Colors.white),
    ),
            ],
          ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: isScanned
                  ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Photo Submitted Successfully!")),
                );
              } : scanID,
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Color(0XFFCCD6E0),
                  backgroundColor: Color(0XFF003366),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),
              child: Text(isScanned ? "SUBMIT PHOTO": "SCAN ID",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){
    final Paint paint = Paint()
        ..color = Colors.grey
        ..strokeWidth = 3.5
        ..style = PaintingStyle.stroke;

    const double cornerRadius = 16.0;

    // Top-left corner
    canvas.drawLine(
        const Offset(cornerRadius, 0),
        Offset(size.width * 0.3, 0),
        paint,);

    canvas.drawLine(
        Offset(0, cornerRadius),
        Offset(0, size.height * 0.3),
        paint,);

    canvas.drawArc(Rect.fromCircle(center: Offset(cornerRadius, cornerRadius),
        radius: cornerRadius), -pi, pi/2, false, paint);

    // Top-right corner
    canvas.drawLine(
        Offset(size.width - size.width * 0.3, 0),
        Offset(size.width - cornerRadius, 0),
        paint,);

    canvas.drawLine(
        Offset(size.width, cornerRadius),
        Offset(size.width, size.height * 0.3),
        paint,);

    canvas.drawArc(Rect.fromCircle(
        center: Offset(size.width - cornerRadius, cornerRadius),
        radius: cornerRadius),
        -pi/2, pi/2, false, paint);

    // Bottom-Left Corner
    canvas.drawLine(
      Offset(0, size.height-cornerRadius),
      Offset(0, size.height - size.height * 0.3),
      paint,);

    canvas.drawLine(
        Offset(cornerRadius, size.height),
        Offset(size.width * 0.3, size.height),
        paint,);

    canvas.drawArc(Rect.fromCircle(
        center: Offset(cornerRadius, size.height - cornerRadius),
        radius: cornerRadius), pi, -pi /2, false, paint);

    // Bottom-Right Corner
    canvas.drawLine(
        Offset(size.width - cornerRadius, size.height),
        Offset(size.width - size.width * 0.3, size.height),
        paint,);

    canvas.drawLine(
        Offset(size.width, size.height - cornerRadius),
        Offset(size.width, size.height - size.height * 0.3),
        paint,);

    canvas.drawArc(Rect.fromCircle(
        center: Offset(size.width-cornerRadius, size.height-cornerRadius),
        radius: cornerRadius),
        pi/2, -pi/2, false, paint);

  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
}
