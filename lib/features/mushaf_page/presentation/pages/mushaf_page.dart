import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/styles.dart';

import 'generate_page.dart';

class MushafPage extends StatelessWidget {
  final int pageNumber;
  const MushafPage({Key? key, required this.pageNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: AutoSizeText(
          generatePage(pageNumber: pageNumber),
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
          style: verseStyle,
          minFontSize: 20,
          maxLines: 15,
        ));
  }
}
