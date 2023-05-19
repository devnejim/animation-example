import 'package:animation_example/animations/menu_animations.dart';
import 'package:animation_example/animations/white_shape_animations.dart';
import 'package:animation_example/controllers/menu_controller.dart';
import 'package:animation_example/controllers/white_shape_controller.dart';
import 'package:flutter/material.dart' show AnimationStatus;

class HomeScreenController {
  HomeScreenController({
    required this.menuController,
    required this.whiteShapeController,
  });
  final MenuController menuController;
  final WhiteShapeController whiteShapeController;

  MenuAnimations get menuAnimations => menuController.menuAnimations;
  WhiteShapeAnimations get whiteShapeAnimations =>
      whiteShapeController.whiteShapeAnimations;

  void startAnimation() {
    menuController.forwardController();
    whiteShapeController.forwardController();
    _resetShapeOnMenuClose();
  }

  void reverseAnimation() {
    menuController.reverseController();
  }

  void onVerticalDragUpdate(double newPosition) {
    menuController.onVerticalDrag(newPosition);
    whiteShapeController.onVerticalDrag(
        targetPosition: menuController.menuAnimations.targetPosition,
        fabPosition: menuController.fabPosition);
  }

  void onVerticalDragEnd() {
    menuController.onVerticalDragEnd();
    whiteShapeController.onVerticalDragEnd();
  }

  void _resetShapeOnMenuClose() {
    menuAnimations.animationController
        .addStatusListener(_resetWhiteShapeControllerListener);
  }

  void _resetWhiteShapeController() {
    whiteShapeController.resetController();
  }

  void _resetWhiteShapeControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      _resetWhiteShapeController();
    }
  }

  void dispose() {
    menuAnimations.animationController
        .removeStatusListener(_resetWhiteShapeControllerListener);
    menuController.dispose();
    whiteShapeController.dispose();
  }
}
