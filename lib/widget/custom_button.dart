import 'package:flutter/material.dart';

class CustomGestureDetectorButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? iconWidget;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Widget? child;

  const CustomGestureDetectorButton({
    super.key,
    this.onTap,
    this.iconWidget,
    required this.label,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Align(
          alignment: Alignment.center,
          child: child ?? _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (iconWidget != null && label.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWidget!,
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: TextStyle(color: textColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      );
    } else if (iconWidget != null) {
      return iconWidget!;
    } else {
      return Text(
        label,
        style: TextStyle(color: textColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
      );
    }
  }
}
