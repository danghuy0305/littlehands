import 'package:flutter/material.dart';

class SHNoSplashButton extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function()? onDoubleTap;
  const SHNoSplashButton({
    Key? key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: child,
    );
  }
}
