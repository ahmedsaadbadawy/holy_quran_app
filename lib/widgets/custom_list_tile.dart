import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/surah_model.dart';
import 'package:quran_app/views/detail_view.dart';

import '../constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.surahModel,
  });
  final SurahModel surahModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailView(
                  surah: surahModel,
                )));
      },
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/svgs/nomor-surah.svg'),
            Text(
              '${surahModel.number}',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        title: Text(
          '${surahModel.enName}',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              surahModel.revelation!,
              style: GoogleFonts.poppins(
                color: text,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2), color: text),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${surahModel.numberOfVerses} Ayat",
              style: GoogleFonts.poppins(
                color: text,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
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
