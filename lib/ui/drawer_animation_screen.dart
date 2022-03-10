import 'package:flutter/material.dart';

class DrawerAnimationScreen extends StatefulWidget {
  const DrawerAnimationScreen({Key? key}) : super(key: key);

  @override
  State<DrawerAnimationScreen> createState() => _DrawerAnimationScreenState();
}

class _DrawerAnimationScreenState extends State<DrawerAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double drawerPeekX =
              animationController.value * (screenSize.width / 2.8);
          double bodyScale = 1 - (0.2 * animationController.value);
          double drawerPeekY =
              (screenSize.height - (bodyScale * screenSize.height)) / 2;

          return Stack(
            children: [
              Container(color: Colors.blue),
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
                        margin: const EdgeInsets.only(top: 24),
                        child: IconButton(
                          onPressed: () {
                            if (animationController.value == 0) {
                              animationController.forward();
                            } else {
                              animationController.reverse();
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
