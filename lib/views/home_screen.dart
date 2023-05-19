import 'package:animation_example/constants/app_colors.dart';
import 'package:animation_example/constants/sizes.dart';
import 'package:animation_example/constants/strings.dart';
import 'package:animation_example/controllers/home_screen_controller.dart';
import 'package:animation_example/extensions/build_context_extension.dart';
import 'package:animation_example/extensions/string_extension.dart';
import 'package:animation_example/widgets/bottom_bar.dart';
import 'package:animation_example/widgets/white_shape.dart';
import 'package:flutter/material.dart' hide MenuController;

import '../widgets/fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.controller});

  final HomeScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: AnimatedBuilder(
            animation: controller.menuAnimations.animationController,
            builder: (context, _) {
              return ColoredBox(
                color:
                    controller.menuAnimations.backgroundColorAnimation.value!,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    if (!controller.menuController.isMenu)
                      Positioned(
                        top: context.screenHeight * 0.20,
                        child: FadeTransition(
                          opacity: controller.menuAnimations.opacityAnimation,
                          child: Text(
                            Strings.events.capFirst,
                            style: context.textTheme.headlineLarge!
                                .copyWith(color: AppColors.darkBlue),
                          ),
                        ),
                      ),
                    Positioned(
                      width: context.screenWidth,
                      height: context.screenHeight * 0.10,
                      bottom: 0,
                      child: BottomBar(
                        animation: controller.menuAnimations.opacityAnimation,
                        onIconPressed: (_) {},
                      ),
                    ),
                    if (controller.menuController.isMenu)
                      Positioned(
                        bottom: Sizes.menuItemHeight,
                        child: FadeTransition(
                          opacity: controller.menuAnimations.menuItemsAnimation,
                          child: Column(
                            children: controller.menuController.menuItems,
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      height: context.screenHeight,
                      width: context.screenWidth,
                      child: WhiteShape(controller: controller),
                    ),
                    AppFloatingButton(controller: controller)
                  ],
                ),
              );
            }),
      ),
    );
  }
}
