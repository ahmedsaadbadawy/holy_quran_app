import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LastRead extends StatefulWidget {
  const LastRead({
    super.key,
  });

  @override
  State<LastRead> createState() => _LastReadState();
}

class _LastReadState extends State<LastRead> {
  String name = 'Al-Fatihah';
  @override
  Widget build(BuildContext context) {
    prefs.listen(() {
      //name = prefs.read(kPrefSurahName);
      setState(() {});
    });
    return Stack(
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
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset('assets/svgs/quran.svg'),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                prefs.read(kPrefSurahName) ?? 'Al-Fatihah',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Aya No: ${prefs.read(kPrefAyaNumber)}',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
