import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IdHeaderWidget extends StatelessWidget {
  final double percentage;
  const IdHeaderWidget({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFF8F8F8),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.arrow_back)),
                  const Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
    ],
              ),
              const SizedBox(width: 8.0,),
              const Text(
                "Verify Your Identity",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          CircularPercentIndicator(
            radius: 24.0,
            lineWidth: 4.0,
            percent: percentage / 100,
            center: Text(
              "${percentage.toInt()}%",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            progressColor: Colors.blue,
            backgroundColor: Colors.grey[300]!,
          ),
        ],
      ),
    );
  }
}
