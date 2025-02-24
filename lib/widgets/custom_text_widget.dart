import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 1.5,
        ),
      ),
    );
  }
}
