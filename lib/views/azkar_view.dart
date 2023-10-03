import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../models/azkar.dart';
import 'azkar_detail_view.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(
              'Azkar',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: tm == ThemeMode.dark ? Colors.white : primary,
              ),
            ),
          ],
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height:
                            MediaQuery.of(context).size.width < 365 ? 175 : 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0, .6, 1],
                            colors: linearGradiant,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 15, right: 20),
                          child: Text(
                            '  الَّذِينَ آمَنُوا وَتَطْمَئِنُّ قُلُوبُهُمْ بِذِكْرِ اللَّهِ أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize:MediaQuery.of(context).size.width < 365 ?18 : 22,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AzkarInkWell(
                context: context,
                title: 'اذكار المساء',
                number: 1,
              ),
              Divider(color: const Color(0xFF7B80AD).withOpacity(.3)),
              AzkarInkWell(
                context: context,
                title: 'اذكار الصباح',
                number: 2,
              ),
              Divider(color: const Color(0xFF7B80AD).withOpacity(.3)),
              AzkarInkWell(
                context: context,
                title: 'اذكار الاستيقاظ من النوم',
                number: 3,
              ),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  InkWell AzkarInkWell(
      {required BuildContext context,
      required String title,
      required int number}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AzkarDetailView(
              title: azkar[number - 1]['title'],
              data: azkar[number - 1]['data'],
            ),
          ),
        );
      },
      child: Text(
        title,
        style: GoogleFonts.amiri(
          color: primary,
          fontSize: MediaQuery.of(context).size.width < 365 ?20 : 22,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
      ),
    );
  }
}
