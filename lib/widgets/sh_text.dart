import 'package:flutter/material.dart';

class SHText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final bool softWrap;
  final TextAlign? textAlign;

  const SHText({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
    this.softWrap = true,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
      overflow: TextOverflow.fade,
      softWrap: softWrap,
      textAlign: textAlign,
    );
  }
}
