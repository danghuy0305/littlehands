import 'package:flutter/material.dart';
import 'package:sign_helper/resources/app_colors.dart';
import 'package:sign_helper/utils/utility.dart';
import 'package:sign_helper/widgets/app_icon.dart';
import 'package:sign_helper/widgets/sh_text.dart';

class SHDocumentListItem extends StatelessWidget {
  final String imageName;
  final String documentName;
  final DateTime uploadDate;

  const SHDocumentListItem({
    super.key,
    required this.imageName,
    required this.documentName,
    required this.uploadDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Utility.getFullImagePath(imageName),
          height: 40,
          width: 40,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SHText(
                title: documentName,
                fontSize: 14,
                textColor: SHColors.neutral6,
                fontWeight: FontWeight.w400,
              ),
              const SHText(
                title: "Tải lên ngày 08.03.2024",
                fontSize: 11,
                textColor: SHColors.neutral8,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        const SHIcon(
          "trash_can",
          color: Color(0xFFFF3030),
          size: 24,
        ),
      ],
    );
  }
}
