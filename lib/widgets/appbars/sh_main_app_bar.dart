import 'package:flutter/material.dart';
import 'package:sign_helper/widgets/sh_text.dart';

import '../../resources/app_colors.dart';
import '../app_icon.dart';

class SHMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final void Function()? onTapBack;

  const SHMainAppBar({
    Key? key,
    this.actions,
    this.title,
    this.onTapBack,
  }) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: getTabBarElements(context: context),
        ),
      ),
    );
  }

  List<Widget> getTabBarElements({required BuildContext context}) {
    final List<Widget> container = [];
    // back icon
    container.add(
      InkWell(
        onTap: () {
          if (onTapBack == null) {
            Navigator.of(context).pop();
          } else {
            onTapBack!();
          }
        },
        child: const SHIcon(
          "arrow_back",
          color: SHColors.primaryBlue,
          size: 26,
        ),
      ),
    );
    if (title != null) {
      container.add(const SizedBox(width: 10));
      container.add(
        Expanded(
          child: SHText(
            title: title!,
            softWrap: false,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            textColor: SHColors.primaryBlue,
          ),
        ),
      );
    }
    if (actions != null) {
      if (title == null) container.add(const Expanded(child: SizedBox()));
      for (final e in actions!) {
        container.add(const SizedBox(width: 10));
        container.add(e);
      }
    }
    return container;
  }
}
