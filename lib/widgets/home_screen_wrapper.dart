import 'package:animation_example/animations/menu_animations.dart';
import 'package:animation_example/animations/white_shape_animations.dart';
import 'package:animation_example/constants/constants.dart';
import 'package:animation_example/constants/sizes.dart';
import 'package:animation_example/controllers/home_screen_controller.dart';
import 'package:animation_example/controllers/menu_controller.dart';
import 'package:animation_example/controllers/white_shape_controller.dart';
import 'package:animation_example/views/home_screen.dart';
import 'package:flutter/material.dart' hide MenuController;

const _kAnimationDuration = Duration(milliseconds: 350);

class HomeScreenWrapper extends StatefulWidget {
  const HomeScreenWrapper({super.key});

  @override
  State<HomeScreenWrapper> createState() => _HomeScreenWrapperState();
}

class _HomeScreenWrapperState extends State<HomeScreenWrapper>
    with TickerProviderStateMixin {
  late HomeScreenController controller;
  late AnimationController menuAnimationsController;
  late AnimationController whiteShapeAnimationsController;
  late double targetPosition;
  @override
  void initState() {
    super.initState();
    targetPosition = (Constants.menuItems.length + 2) * Sizes.menuItemHeight;
    menuAnimationsController =
        AnimationController(vsync: this, duration: _kAnimationDuration);
    whiteShapeAnimationsController =
        AnimationController(vsync: this, duration: _kAnimationDuration);

    controller = HomeScreenController(
        menuController: MenuController(
            menuAnimations: MenuAnimations(
                animationController: menuAnimationsController,
                targetPosition: targetPosition)),
        whiteShapeController: WhiteShapeController(
            whiteShapeAnimations: WhiteShapeAnimations(
                animationController: whiteShapeAnimationsController,
                targetPosition: targetPosition)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      controller: controller,
    );
  }
}
