import 'package:flutter/material.dart';

import 'app_text_field.dart';

class AppDropDown extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;
  final String label;
  final Color? bgColor;
  final String? initValue;
  final Widget? suffixIcon;
  const AppDropDown({
    super.key,
    required this.controller,
    required this.onPressed,
    this.bgColor,
    required this.label,
    this.initValue,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: label,
      initValue: initValue,
      bgColor: bgColor,
      controller: controller,
      readOnly: true,
      suffixIcon: suffixIcon ??
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            onPressed: onPressed,
          ),
    );
  }
}
