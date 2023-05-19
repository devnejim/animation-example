import 'package:animation_example/constants/app_colors.dart';
import 'package:animation_example/constants/sizes.dart';
import 'package:animation_example/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.menuItemHeight,
      width: context.screenWidth * 0.30,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium!.copyWith(color: AppColors.white),
      ),
    );
  }
}
