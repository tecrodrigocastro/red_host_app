import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
  });

  final VoidCallback onPressed;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color ?? theme.primaryColor,
        padding: const EdgeInsets.all(12),
        fixedSize: Size(size.width, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: color ?? theme.primaryColor,
              width: 2,
            )),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: color == null ? Colors.white : theme.primaryColor,
        ),
      ),
    );
  }
}
