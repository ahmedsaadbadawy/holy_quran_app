import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/views/detail_view.dart';

import '../constants.dart';

class CustomSurahListTile extends StatelessWidget {
  const CustomSurahListTile({
    super.key,
    required this.surahModel,
    required this.tapName,
  });
  final SurahModel surahModel;
  final String tapName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailView(
              surah: surahModel,
              tapName: tapName,
            ),
          ),
        );

        prefs.write(kPrefSurahName, surahModel.enName);
      },
      child: ListTile(
        horizontalTitleGap: 10,
        minLeadingWidth: 10,
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/svgs/hexagon.png',
              height: MediaQuery.of(context).size.width / 10,
              width: MediaQuery.of(context).size.width / 10,
              color: primary,
            ),
            Text(
              '${surahModel.number}',
              style: TextStyle(color: font),
            ),
          ],
        ),
        title: Text(
          '${surahModel.enName}',
          style: GoogleFonts.poppins(
            color: font,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: SafeArea(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                surahModel.revelation!,
                style: GoogleFonts.poppins(
                  color: text,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2), color: text),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "${surahModel.numberOfVerses} Ayat",
                style: GoogleFonts.poppins(
                  color: text,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        trailing: Text(
          '${surahModel.name}',
          style: GoogleFonts.amiri(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
