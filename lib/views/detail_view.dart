import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/constants.dart';

import '../models/surah_model.dart';
import '../widgets/custom_detail_card.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.surah});
  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: customAppBar(surahName: surah.enName!, context: context),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: CustomDetailCard(surah: surah),
            ),
          ],
          body: Center(),
        ));
  }
}



AppBar customAppBar(
    {required String surahName, required BuildContext context}) {
  return AppBar(
    backgroundColor: background,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Row(children: [
      IconButton(
          onPressed: (() => Navigator.of(context).pop()),
          icon: SvgPicture.asset('assets/svgs/back-icon.svg')),
      const SizedBox(
        width: 24,
      ),
      Text(
        surahName,
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      IconButton(
          onPressed: (() => {}),
          icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
    ]),
  );
}
