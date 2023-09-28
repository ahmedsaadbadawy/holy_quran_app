import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/tips.dart';

import '../constants.dart';
import '../widgets/tip_item.dart';

// ignore: must_be_immutable
class TipsView extends StatelessWidget {
  const TipsView({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/menu-icon.svg'),
            ),
            const SizedBox(width: 24),
            Text(
              'Tips',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 131,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0, .6, 1],
                      colors: [
                        Color(0xFFB691FF),
                        Color(0xFF6918B4),
                        Color(0xFF36117E),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Text(
                      'Important Islamic advice and guidance for every Muslim',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        body: ListView.builder(
          itemCount: tips.length,
          itemBuilder: (context, index) {
            return TipItem(
              title: tips[index]['title'],
              body: tips[index]['body'],
            );
          },
        ),
      ),
    );
  }
}
