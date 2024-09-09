import 'package:flutter/material.dart';
import 'package:sign_helper/pages/document_list/document_item/sh_document_list_item.dart';
import 'package:sign_helper/pages/select_document/sh_select_document_page.dart';
import 'package:sign_helper/resources/app_colors.dart';
import 'package:sign_helper/widgets/app_icon.dart';
import 'package:sign_helper/widgets/appbars/sh_main_app_bar.dart';
import 'package:sign_helper/widgets/sh_background_container.dart';

class SHDocumentListPage extends StatefulWidget {
  const SHDocumentListPage({super.key});

  @override
  State<SHDocumentListPage> createState() => _SHDocumentListPageState();
}

class _SHDocumentListPageState extends State<SHDocumentListPage> {
  void _onTapPlusClosure({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SHSelectDocumentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SHMainAppBar(
        title: "Danh sách tập tin",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onTapPlusClosure(context: context),
        backgroundColor: SHColors.primaryBlue,
        shape: const CircleBorder(),
        child: const SHIcon(
          "plus",
          color: Colors.white,
        ),
      ),
      body: SHBackgroundContainer(
        child: Container(
          color: Colors.transparent,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SHDocumentListItem(
                imageName: "document_image",
                documentName: "mèo con đi học.jpeg",
                uploadDate: DateTime.now(),
              ),
              const SizedBox(height: 20),
              SHDocumentListItem(
                imageName: "document_file",
                documentName: "truyện tấm cám.pdf",
                uploadDate: DateTime.now(),
              ),
              const SizedBox(height: 20),
              SHDocumentListItem(
                imageName: "document_video",
                documentName: "tin tức.mp4",
                uploadDate: DateTime.now(),
              ),
              const SizedBox(height: 20),
              SHDocumentListItem(
                imageName: "document_audio",
                documentName: "đọc truyện.mp3",
                uploadDate: DateTime.now(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
