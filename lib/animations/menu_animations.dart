import 'package:animation_example/constants/app_colors.dart';
import 'package:flutter/animation.dart';

class MenuAnimations {
  MenuAnimations({
    required this.animationController,
    required this.targetPosition,
  });
  final AnimationController animationController;
  final double targetPosition;

  Animation<double> get fabPositionAnimation => Tween<double>(
        begin: 0,
        end: targetPosition,
      ).animate(CurvedAnimation(
          parent: animationController, curve: const Interval(0.0, 0.7)));

  Animation<double> get menuItemsAnimation =>
      Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1),
      ));
  Animation<Color?> get backgroundColorAnimation =>
      ColorTween(begin: AppColors.white, end: AppColors.primary)
          .animate(animationController);

  Animation<double> get opacityAnimation =>
      Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
          parent: animationController, curve: const Interval(0, 0.5)));

  Animation<Color?> get fabColorAnimation =>
      ColorTween(begin: AppColors.primary, end: AppColors.white)
          .animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.8, 1),
      ));

  Animation<Color?> get fabIconColorAnimation =>
      ColorTween(begin: AppColors.white, end: AppColors.primary).animate(
          CurvedAnimation(
              parent: animationController, curve: const Interval(0.8, 1)));

  double get controllerVal => animationController.value;
}
