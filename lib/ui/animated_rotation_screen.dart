import 'package:flutter/material.dart';

class AnimatedRotationScreen extends StatefulWidget {
  const AnimatedRotationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedRotationScreen> createState() => _AnimatedRotationScreenState();
}

class _AnimatedRotationScreenState extends State<AnimatedRotationScreen> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Container",
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _turns = 0;
              });
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _turns = 45 / 360;
            });
          },
          child: AnimatedRotation(
            turns: _turns,
            duration: const Duration(milliseconds: 300),
            child: Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
