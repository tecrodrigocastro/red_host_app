import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.onPressed, required this.title});

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: theme.primaryColor,
        padding: const EdgeInsets.all(12),
        fixedSize: Size(size.width, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: theme.primaryColor,
              width: 2,
            )),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
