import 'package:animation_example/constants/sizes.dart';
import 'package:animation_example/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class WhiteShapeAnimations {
  WhiteShapeAnimations({
    required this.animationController,
    required this.targetPosition,
  });
  final AnimationController animationController;
  final double targetPosition;

  Animation<double> drawWhiteShapeAnimationSequence(BuildContext context) {
    return TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: targetPosition), weight: 0.7),
      TweenSequenceItem(
          tween: Tween<double>(
              begin: targetPosition,
              end: 0 - (context.screenHeight * 0.10 + Sizes.fabRadius)),
          weight: 0.3),
    ]).animate(animationController);
  }

  Animation<double> narrowShapeAnimation(BuildContext context) {
    return Tween<double>(begin: 0, end: context.screenWidth * 0.03).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 0.7),
      ),
    );
  }
}
