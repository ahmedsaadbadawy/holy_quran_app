import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../models/ayat_model.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    super.key,
    required this.ayat,
  });
  final AyatModel ayat;

  @override
  Widget build(BuildContext context) {
    if (pageNum == ayat.page) {
      return Stack(
        alignment: Alignment.centerRight,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 50, top: 20, bottom: 20),
            child: GestureDetector(
              onHorizontalDragDown: (_) {
                prefs.write(kPrefAyaNumber, ayat.numberinSurah);
                prefs.write(kPrefNumberOfAyat, ayat.numberinQuran);
              },
              child: Text(
                ayat.quran!.trim(),
                style: GoogleFonts.amiri(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Positioned(
            right: 14,
            child: Text(
              '${ayat.numberinSurah}',
              style: TextStyle(color: primary),
            ),
          ),
          Image.asset(
            'assets/svgs/Scheherazade.svg.png',
            width: 40,
            height: 50,
            fit: BoxFit.cover,
            color: primary,
          ),
        ],
      );
    } else {
      pageNum = ayat.page!;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Divider(color: const Color(0xFF7B80AD).withOpacity(.3)),
          Text(
            'juz: ${ayat.juz!}             hizbQuarter: ${ayat.hizbQuarter!}           Page ${ayat.page!}',
            style: GoogleFonts.amiri(
              color: primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 50, top: 20, bottom: 20),
                child: GestureDetector(
                  onHorizontalDragDown: (_) {
                    prefs.write(kPrefAyaNumber, ayat.numberinSurah);
                    prefs.write(kPrefNumberOfAyat, ayat.numberinQuran);
                  },
                  child: Text(
                    ayat.quran!,
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Positioned(
                right: 14,
                child: Text(
                  '${ayat.numberinSurah}',
                  style: TextStyle(color: primary),
                ),
              ),
              Image.asset(
                'assets/svgs/Scheherazade.svg.png',
                width: 40,
                height: 50,
                fit: BoxFit.cover,
                color: primary,
              ),
            ],
          ),
        ],
      );
    }
  }
}
