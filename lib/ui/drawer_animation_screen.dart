import 'package:flutter/material.dart';

class DrawerAnimationScreen extends StatefulWidget {
  const DrawerAnimationScreen({Key? key}) : super(key: key);

  @override
  State<DrawerAnimationScreen> createState() => _DrawerAnimationScreenState();
}

class _DrawerAnimationScreenState extends State<DrawerAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation<double> _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    // _curvedAnimation = Tween(
    //   begin: _animationController.lowerBound,
    //   end: _animationController.upperBound,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: Curves.linear,
    //   ),
    // );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          double value = _animationController.value;

          double drawerPeekX = value * (screenSize.width / 2.8);
          double bodyScale = 1 - (0.2 * value);
          double drawerPeekY =
              (screenSize.height - (bodyScale * screenSize.height)) / 2;
          double statusBarHeight = MediaQuery.of(context).viewPadding.top;

          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  _animationController.reverse();
                },
                child: Container(color: Colors.blue),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(drawerPeekX, drawerPeekY)
                  ..scale(bodyScale, bodyScale),
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: statusBarHeight),
                        child: IconButton(
                          onPressed: () {
                            if (value == 0) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          },
                          icon: const Icon(
                            Icons.menu_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
