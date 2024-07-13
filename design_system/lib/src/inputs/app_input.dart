import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({
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
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.darkGrey,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.darkGrey,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.darkGrey,
            style: BorderStyle.solid,
          ),
        ),
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
          color: AppColors.darkGrey.withOpacity(0.5),
        ),
      ),
      cursorColor: AppColors.primary,
    );
  }
}
