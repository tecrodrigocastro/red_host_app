// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  const IconComponent({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 30,
    this.color = Colors.white,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
