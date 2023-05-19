import 'dart:math' show pi;

import 'package:animation_example/constants/sizes.dart';
import 'package:animation_example/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({
    super.key,
    required this.controller,
  });

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => !controller.menuController.isMenu
          ? controller.startAnimation()
          : controller.reverseAnimation(),
      onVerticalDragUpdate: (details) =>
          controller.onVerticalDragUpdate(details.delta.dy),
      onVerticalDragEnd: (_) => controller.onVerticalDragEnd(),
      child: AnimatedBuilder(
          animation: controller.menuAnimations.fabPositionAnimation,
          builder: (_, __) {
            return Transform(
              transform: Matrix4.identity()
                ..setTranslationRaw(
                  0,
                  controller.menuController.fabPosition,
                  0,
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: Sizes.fabBottomPadding),
                    child: CircleAvatar(
                      radius: Sizes.fabRadius,
                      backgroundColor:
                          controller.menuAnimations.fabColorAnimation.value,
                      child: Transform.rotate(
                        angle: controller.menuAnimations.controllerVal * pi / 4,
                        child: Icon(
                          Icons.add,
                          color: controller
                              .menuAnimations.fabIconColorAnimation.value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
