import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/views/ayat_detail_view.dart';

import '../constants.dart';
import '../views/pages_detail_view.dart';

class CustomSurahListTile extends StatelessWidget {
  const CustomSurahListTile({
    super.key,
    required this.surahModel,
    required this.tapName,
    required this.listofSurah,
  });
  final SurahModel surahModel;
  final String tapName;
  final dynamic listofSurah;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (tapName == kPageTabName) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PageDetailView(
                surahNum: surahModel.number! - 1,
                listofSurah: listofSurah,
              ),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AyatDetailView(
                 surahNum: surahModel.number! - 1,
                listofSurah: listofSurah,
              ),
            ),
          );
        }
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
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        title: Text(
          '${surahModel.enName}',
          style: GoogleFonts.poppins(
            color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).hintColor,
                  fontWeight: MediaQuery.of(context).size.width < 365
                      ? FontWeight.w400
                      : FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width < 365 ? 10 : 14,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Theme.of(context).hintColor),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "${surahModel.numberOfVerses} Ayat",
                style: GoogleFonts.poppins(
                  color: Theme.of(context).hintColor,
                  fontWeight: MediaQuery.of(context).size.width < 365
                      ? FontWeight.w400
                      : FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width < 365 ? 10 : 14,
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
