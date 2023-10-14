import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../models/surah_model.dart';

class CustomDetailCard extends StatelessWidget {
  const CustomDetailCard({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.width < 365 ? 280 : 247,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, .6, 1],
              colors: linearGradiant,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width < 365 ? -22 : 10,
          right: -60,
          child: Opacity(
            opacity: .2,
            child: Image.asset(
              'assets/svgs/muslim.png',
              width: 324 - 55,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Text(
                surah.enName!,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 26),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                surah.name!,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
              Divider(
                color: Colors.white.withOpacity(.35),
                thickness: 1,
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    surah.revelation!,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
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
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${surah.numberOfVerses} Ayat",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/svgs/bismillah.png',
                fit: BoxFit.fill,
                width: 250,
                height: 80,
                color: Colors.white,
              )
            ],
          ),
        )
      ]),
    );
  }
}
