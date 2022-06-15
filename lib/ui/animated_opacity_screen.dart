import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double _opacityValue = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Opacity",
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _opacityValue = 0.1;
              });
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacityValue,
          duration: const Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _opacityValue = 1;
              });
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
