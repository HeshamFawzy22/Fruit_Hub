// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.obSecureText = false,
    required this.hintText,
    required this.inputType,
    this.suffixIcon,
    this.onSaved,
  });
  final bool obSecureText;
  final String hintText;
  final TextInputType? inputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
        suffixIcon: suffixIcon,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        // focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1.0),
    );
  }
}
