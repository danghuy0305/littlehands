import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sign_helper/utils/utility.dart';

class SHBackgroundContainer extends StatelessWidget {
  final Widget child;
  final Widget? background;

  const SHBackgroundContainer({
    super.key,
    required this.child,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Container(
            color: Colors.white,
          ),
        ),
        if (background != null)
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: background!,
          ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            Utility.getFullImagePath("bg_pattern"),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: child,
        ),
      ],
    );
  }
}
