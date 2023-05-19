import 'package:animation_example/animations/white_shape_animations.dart';
import 'package:animation_example/extensions/num_extension.dart';
import 'package:flutter/animation.dart';

class WhiteShapeController {
  WhiteShapeController({required this.whiteShapeAnimations});
  final WhiteShapeAnimations whiteShapeAnimations;

  AnimationController get _animationController =>
      whiteShapeAnimations.animationController;

  void forwardController() {
    _animationController.forward();
  }

  void reverseController() {
    _animationController.reverse();
  }

  void resetController() {
    _animationController.reset();
  }

  void onVerticalDrag(
      {required double targetPosition, required double fabPosition}) {
    _animationController.value = fabPosition.normalize(targetPosition / 0.7);
  }

  void onVerticalDragEnd() {
    _animationController.animateTo(1);
  }

  void dispose() {
    whiteShapeAnimations.animationController.dispose();
  }
}
