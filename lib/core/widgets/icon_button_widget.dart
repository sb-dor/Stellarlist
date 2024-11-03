import 'package:flutter/material.dart';
import 'package:stellarlist/core/utils/app_colors.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double? size;
  final Color? color;
  final EdgeInsets? buttonPadding;

  const IconButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 20,
    this.color,
    this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          StadiumBorder(),
        ),
        padding: buttonPadding != null
            ? WidgetStatePropertyAll(buttonPadding)
            : const WidgetStatePropertyAll(
                EdgeInsets.all(6.0),
              ),
        elevation: const WidgetStatePropertyAll(0.0),
        backgroundColor: WidgetStatePropertyAll(
          AppColors.iconButtonBackgroundColor,
        ),
        overlayColor: WidgetStatePropertyAll(
          AppColors.iconButtonBackgroundHoverColor,
        ),
      ),
      padding: const EdgeInsets.all(0),
      constraints: const BoxConstraints(),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: color ?? Colors.white,
        size: size,
      ),
    );
  }
}
