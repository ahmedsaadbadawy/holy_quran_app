import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/services/ayat_service.dart';
import 'package:quran_app/widgets/page_item.dart';

import '../models/surah_model.dart';
import '../widgets/ayat_item.dart';
import '../widgets/custom_detail_card.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
    required this.surah,
    required this.tapName,
  });
  final SurahModel surah;
  final String tapName;
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
          body: FutureBuilder(
              future: AyatService().getAllAyat(surahNumber: surah.number!),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  //print('snapshot = ${snapshot.error}');
                  return Container();
                } else {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      if (tapName == 'PageTap') {
                        return PageItem(ayat: snapshot.data[index]);
                      }
                      return AyatItem(ayat: snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              }),
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
