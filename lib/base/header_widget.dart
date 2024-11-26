import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final bool showBackButton;
  final String text;

  const HeaderWidget({super.key,
    required this.showBackButton,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          if (showBackButton)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              "Back",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
      ],
      ),
    );
  }
}
