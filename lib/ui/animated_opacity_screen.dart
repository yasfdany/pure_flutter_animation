import 'package:flutter/material.dart';

class AnimatedOpacityScreen extends StatefulWidget {
  const AnimatedOpacityScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedOpacityScreen> createState() => _AnimatedOpacityScreenState();
}

class _AnimatedOpacityScreenState extends State<AnimatedOpacityScreen> {
  double opacityValue = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Opacity",
        ),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityValue,
          duration: const Duration(milliseconds: 300),
          child: GestureDetector(
            onTap: () {
              setState(() {
                opacityValue = 1;
              });
              // setState(() {
              //   opacityValue = opacityValue == 0.1 ? 1 : 0.1;
              // });
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
