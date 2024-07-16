import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppInputFiled extends StatelessWidget {
  const AppInputFiled({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      validator: (value) => validator!(value!),
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(6),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.darkGrey.withOpacity(0.5),
        ),
      ),
      cursorColor: AppColors.primary,
    );
  }
}
