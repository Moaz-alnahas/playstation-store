import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffixIcon;
  final Color? textColor;
  final Color? hintColor;
  final double? fontSize;
  final Color? fillColor;
  final Function(String)? onChanged; // ✅ أضفنا هذا السطر

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.maxLines,
    this.textColor,
    this.hintColor,
    this.fontSize,
    this.fillColor,
    this.onChanged, // ✅ أضفنا هذا أيضًا
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: fillColor ?? const Color.fromRGBO(240, 240, 240, 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        cursorHeight: 18,
        cursorWidth: 1.5,
        maxLength: maxLength,
        onChanged: onChanged, // ✅ صار يشتغل
        maxLines: maxLines,
        style: TextStyle(
          color: textColor ?? const Color.fromRGBO(29, 29, 29, 1),
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor ?? Colors.grey,
            fontSize: fontSize != null ? fontSize! - 2 : 14,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.black87)
              : null,
          border: InputBorder.none,
          counterText: "",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }
}
