import 'package:flutter/material.dart';
import 'package:new_ventripay/idverification/id_header_widget.dart';

class TakeSelfieScreen extends StatefulWidget {
  const TakeSelfieScreen({super.key});

  @override
  State<TakeSelfieScreen> createState() => _TakeSelfieScreenState();
}

class _TakeSelfieScreenState extends State<TakeSelfieScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    // Define a linear animation from top to bottom
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          IdHeaderWidget(percentage: 70.0),
          SizedBox(height: 20,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Take A Selfie",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32.0,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: Colors.grey[400]!, width: 2.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: Container(
                                  color: Colors.grey[200],
                                ),
                            ),
                            AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child){
                                  return Positioned(
                                    top: _animation.value * 300,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: 4.0,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Transparent circular overlay
                    Positioned(child: Container(
                      width: 150,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(140),
                          left: Radius.circular(140),
                        ),
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
