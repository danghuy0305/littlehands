import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sign_helper/pages/display_result/sh_display_result_audio_page.dart';
import 'package:sign_helper/pages/display_result/sh_display_result_image_page.dart';
import 'package:sign_helper/pages/display_result/sh_display_result_video_page.dart';
import 'package:sign_helper/resources/app_colors.dart';
import 'package:sign_helper/utils/utility.dart';
import 'package:sign_helper/widgets/appbars/sh_main_app_bar.dart';
import 'package:sign_helper/widgets/buttons/sh_no_splash_button.dart';
import 'package:sign_helper/widgets/sh_background_container.dart';
import 'package:sign_helper/widgets/sh_text.dart';

class SHSelectDocumentPage extends StatelessWidget {
  const SHSelectDocumentPage({super.key});

  void _onTapSelectFile({required BuildContext context}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      EasyLoading.show(status: "Loading...");
      await Future.delayed(const Duration(seconds: 1));
      EasyLoading.dismiss();

      File file = File(result.files.single.path!);
      final fileNameExtension = file.path.split(".").last;

      if (fileNameExtension == "jpeg" ||
          fileNameExtension == "jpg" ||
          fileNameExtension == "png") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SHDisplayResultPage(
              file: file,
            ),
          ),
        );
      } else if (fileNameExtension == "mp4" || fileNameExtension == "mov") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SHDisplayResultVideoPage(
              file: file,
            ),
          ),
        );
      } else if (fileNameExtension == "mp3") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SHDisplayResultAudioPage(
              file: file,
            ),
          ),
        );
      }
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SHMainAppBar(title: "Thêm tệp tin mới"),
      body: SHBackgroundContainer(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SHNoSplashButton(
              onTap: () => _onTapSelectFile(context: context),
              child: SizedBox(
                height: 250,
                width: double.maxFinite,
                child: DottedBorder(
                  borderPadding: EdgeInsets.zero,
                  dashPattern: const [8, 8],
                  radius: const Radius.circular(16),
                  borderType: BorderType.RRect,
                  color: SHColors.primaryBlue,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Utility.getFullImagePath("select_file"),
                          height: 120,
                          width: 120,
                        ),
                        const SHText(
                          title: "Tải lên tập tin",
                          fontSize: 16,
                          textColor: SHColors.neutral3,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              width: double.maxFinite,
              child: DottedBorder(
                borderPadding: EdgeInsets.zero,
                dashPattern: const [8, 8],
                radius: const Radius.circular(16),
                borderType: BorderType.RRect,
                color: SHColors.primaryBlue,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Utility.getFullImagePath("select_camera"),
                        height: 120,
                        width: 120,
                      ),
                      const SHText(
                        title: "Chụp ảnh/Quay video",
                        fontSize: 16,
                        textColor: SHColors.neutral3,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
