import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/widgets/custom_snack_bar.dart';
import '../cubits/last_read_cubit/last_read_cubit.dart';
import '../services/ayat_service.dart';
import '../widgets/detail_view_dropdown_menu.dart';
import '../widgets/previous_and_next_surah_navigation.dart';
import '../widgets/custom_detail_card.dart';

class PageDetailView extends StatelessWidget {
  const PageDetailView({
    super.key,
    required this.surahNum,
    required this.listofSurah,
  });
  final int surahNum;
  final dynamic listofSurah;
  @override
  Widget build(BuildContext context) {
    int number = 1;
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return BlocProvider.of<LastReadCubit>(context).changeLastRead(
            ayaNum: number, surahName: listofSurah[surahNum].enName);
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(children: [
            if (MediaQuery.of(context).size.width > 365)
              const SizedBox(
                width: 24,
              ),
            Text(
              listofSurah[surahNum].enName!,
              style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width < 365 ? 14 : 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).highlightColor,
              ),
            ),
            const Spacer(),
            DetailViewDropdownMenu(
                listofSurah: listofSurah, surahNum: surahNum),
          ]),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: CustomDetailCard(surah: listofSurah[surahNum]),
            ),
          ],
          body: FutureBuilder(
            future: AyatService()
                .getAllAyat(surahNumber: listofSurah[surahNum].number!),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return Container();
              } else {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 20),
                      child: Column(
                        children: [
                          SelectableText.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                ...snapshot.data.map(
                                  (verse) {
                                    return TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${verse.quran}',
                                          style: GoogleFonts.notoNaskhArabic(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    365
                                                ? 21
                                                : 26.5,
                                            height: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    365
                                                ? 2
                                                : 2.5,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              number = verse.numberinSurah;
                                              customSnackBar(context,
                                                  'Ayah $number BookMarked');
                                            },
                                        ),
                                        TextSpan(
                                          text: verse.numberinSurah ==
                                                  listofSurah[surahNum]
                                                      .numberOfVerses
                                              ? '\n\uFD3E${verse.numberinSurah}\uFD3F '
                                              : ' \uFD3F${verse.numberinSurah}\uFD3E ',
                                          style: GoogleFonts.notoNaskhArabic(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <
                                                    365
                                                ? 18
                                                : 27,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          PreviousAndNextSurahNavigation(
                              listofSurah: listofSurah, surahNum: surahNum),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
