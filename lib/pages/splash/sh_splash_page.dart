import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sign_helper/pages/document_list/sh_document_list.dart';
import 'package:sign_helper/resources/app_colors.dart';
import 'package:sign_helper/utils/utility.dart';
import 'package:sign_helper/widgets/buttons/sh_no_splash_button.dart';
import 'package:sign_helper/widgets/sh_background_container.dart';
import 'package:sign_helper/widgets/sh_text.dart';

class SHSplashPage extends StatelessWidget {
  const SHSplashPage({super.key});

  _didTapStart({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SHDocumentListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SHBackgroundContainer(
          background: Image.asset(
            Utility.getFullImagePath("bg_splash"),
            fit: BoxFit.cover,
          ),
          child: const SizedBox(),
        ),
        Positioned(
          bottom: 150,
          left: 0,
          right: 0,
          child: Center(
            child: SHNoSplashButton(
              onTap: () => _didTapStart(context: context),
              child: Container(
                height: 56,
                width: 158,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                  child: SHText(
                    title: "Bắt đầu",
                    fontSize: 18,
                    textColor: SHColors.primaryBlue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
