import 'package:animation_example/controllers/home_screen_controller.dart';
import 'package:animation_example/widgets/white_shape_painter.dart';
import 'package:flutter/material.dart';

class WhiteShape extends StatelessWidget {
  const WhiteShape({
    super.key,
    required this.controller,
  });

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: AnimatedBuilder(
          animation: controller.whiteShapeAnimations.animationController,
          builder: (context, _) {
            return CustomPaint(
              painter: WhiteShapePainter(
                animationVal: controller.whiteShapeAnimations
                    .drawWhiteShapeAnimationSequence(context)
                    .value,
                narrowVal: controller.whiteShapeAnimations
                    .narrowShapeAnimation(context)
                    .value,
              ),
            );
          }),
    );
  }
}
