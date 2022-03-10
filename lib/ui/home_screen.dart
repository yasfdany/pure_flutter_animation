import 'package:flutter/material.dart';
import 'package:pure_flutter_animation/ui/animated_opacity_screen.dart';
import 'package:pure_flutter_animation/ui/drawer_animation_screen.dart';
import 'package:pure_flutter_animation/utils/nav_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screens = {
    "Animated Opacity": const AnimatedOpacityScreen(),
    "Drawer Animation": const DrawerAnimationScreen(),
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
