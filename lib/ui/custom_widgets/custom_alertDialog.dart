import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/extensions/string_extension.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  const CustomAlertDialog({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title.translate,
        style: const TextStyle(
          fontFamily: AppFonts.archivo,
          fontSize: AppSizeConstants.size16,
        ),
      ),
      content: Text(
        content.translate,
        style: const TextStyle(
          fontFamily: AppFonts.roboto,
          fontSize: AppSizeConstants.size12,
        ),
      ),
    );
  }
}
