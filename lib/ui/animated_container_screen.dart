import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _radius = 0;
  double _size = 100;
  Color _color = Colors.red;

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
                _size = 100;
                _radius = 0;
                _color = Colors.red;
              });
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: AnimatedContainer(
          width: _size,
          height: _size,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _size = 200;
                _radius = 200 / 2;
                _color = Colors.yellow;
              });
            },
          ),
        ),
      ),
    );
  }
}
