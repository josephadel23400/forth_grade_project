import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextFormFieldWithSuffix extends StatelessWidget {
  const CustomTextFormFieldWithSuffix(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      required this.suffixIcon,
      required this.onChang, required this.isSecure});
  final void Function(String) onChang;
  final String hint;
  final String label;
  final Icon icon;
  final Widget suffixIcon;
  final bool isSecure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure,
      onChanged: onChang,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: kFloatingTextColor),
        prefixIcon: icon,
        hintText: hint,
        labelText: label,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
