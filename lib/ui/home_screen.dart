import 'package:flutter/material.dart';

import '../utils/nav_helper.dart';
import 'animated_container_screen.dart';
import 'animated_opacity_screen.dart';
import 'animated_rotation_screen.dart';
import 'drawer_animation_screen.dart';
import 'rotation_transition_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screens = {
    "Animated Opacity": const AnimatedOpacityScreen(),
    "Animated Container": const AnimatedContainerScreen(),
    "Animated Rotation": const AnimatedRotationScreen(),
    "Drawer Animation": const DrawerAnimationScreen(),
    "Rotation Transition": const RotationTransitionScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pure Flutter Animation",
        ),
      ),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          String key = screens.keys.toList()[index].toString();
          return ListTile(
            title: Text(key),
            onTap: () {
              NavHelper.navigatePush(context, screens[key] as Widget);
            },
          );
        },
      ),
    );
  }
}
