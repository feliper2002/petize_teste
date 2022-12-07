import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  final Color borderColor;
  final Color iconColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final double borderRadius;
  final Color? focusedColorBorder;
  const SearchInput({
    super.key,
    required this.controller,
    required this.size,
    required this.borderColor,
    required this.iconColor,
    this.hintText,
    this.borderRadius = 6,
    this.hintStyle,
    this.focusedColorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: size.width * .018),
      height: size.height * .047,
      width: size.width * .41,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          prefixIcon: Icon(Icons.search, color: iconColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: focusedColorBorder ?? borderColor)),
        ),
      ),
    );
  }
}
