import 'package:flutter/material.dart';

class RotationTransitionScreen extends StatefulWidget {
  const RotationTransitionScreen({Key? key}) : super(key: key);

  @override
  State<RotationTransitionScreen> createState() =>
      _RotationTransitionScreenState();
}

class _RotationTransitionScreenState extends State<RotationTransitionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xff0c1117),
        child: Align(
          child: RotationTransition(
            turns: _animationController,
            alignment: Alignment.center,
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/8/82/Milky_Way_Galaxy.jpg",
              width: 400,
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}
