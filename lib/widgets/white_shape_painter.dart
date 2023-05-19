import 'package:animation_example/constants/app_colors.dart';
import 'package:animation_example/constants/sizes.dart';
import 'package:flutter/material.dart';

class WhiteShapePainter extends CustomPainter {
  const WhiteShapePainter({
    required this.animationVal,
    required this.narrowVal,
  });
  final double animationVal;
  final double narrowVal;
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final fabDiameter = Sizes.fabRadius * 2;
    final Paint paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    path.moveTo(0, height);
    path.quadraticBezierTo(
      width * 0.50 - Sizes.fabRadius,
      height,
      (width * 0.50) - Sizes.fabRadius,
      height - animationVal,
    );
    path.quadraticBezierTo(
      width * 0.50 - (Sizes.fabRadius + Sizes.fabBottomPadding),
      height - (fabDiameter + Sizes.fabBottomPadding) - animationVal,
      width * 0.50,
      height - (fabDiameter + Sizes.fabBottomPadding) - animationVal,
    );
    path.quadraticBezierTo(
      width * 0.50 + (Sizes.fabRadius + Sizes.fabBottomPadding),
      height - (fabDiameter + Sizes.fabBottomPadding) - animationVal,
      (width * 0.50) + Sizes.fabRadius,
      height - animationVal,
    );
    path.quadraticBezierTo(
      width * 0.50 + Sizes.fabRadius,
      height,
      width,
      height,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
