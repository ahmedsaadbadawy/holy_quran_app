import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/surah.dart';
import '../models/surah_model.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: Text(
          surahList[surah.number! - 1]['surah'],
          style: GoogleFonts.amiri(
            color: Theme.of(context).primaryColor,
           fontSize: MediaQuery.of(context).size.width < 365 ?21 : 26,
            height: 2,
            wordSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
          textDirection: TextDirection.rtl,
          //textHeightBehavior: ,
        ),
      ),
    );
  }
}
