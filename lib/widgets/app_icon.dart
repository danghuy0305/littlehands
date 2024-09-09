import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_helper/resources/app_colors.dart';

import '../utils/utility.dart';

class SHIcon extends StatelessWidget {
  final String iconName;
  final Color color;
  final double? size;

  const SHIcon(
    this.iconName, {
    Key? key,
    this.color = SHColors.primaryBlue,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Utility.getFullIconPath(iconName),
      color: color,
      height: size,
      width: size,
      fit: BoxFit.contain,
    );
  }
}
