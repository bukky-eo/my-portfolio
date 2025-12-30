import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/widgets/section_modal.dart';

void showSectionModal(BuildContext context, String title, Widget content) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black,
    builder: (BuildContext context) {
      return SectionModal(
        title: title,
        content: content,
      );
    },
  );
}