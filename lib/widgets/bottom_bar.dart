import 'package:animation_example/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.onIconPressed,
    required this.animation,
  });
  final ValueChanged<int>? onIconPressed;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: animation.value,
            child: Row(
              children: [
                _buildIcon(
                  icon: Icons.calendar_month,
                  onPressed: () => onIconPressed ?? onIconPressed!(0),
                ),
                _buildIcon(
                  icon: Icons.search,
                  onPressed: () => onIconPressed ?? onIconPressed!(1),
                ),
                const Spacer(),
                _buildIcon(
                  icon: Icons.bolt,
                  onPressed: () => onIconPressed ?? onIconPressed!(2),
                ),
                _buildIcon(
                  icon: Icons.account_balance,
                  onPressed: () => onIconPressed ?? onIconPressed!(3),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildIcon({required IconData icon, required VoidCallback onPressed}) {
    return Expanded(
      child: IconButton(
        icon: Icon(
          icon,
          color: AppColors.purple,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
