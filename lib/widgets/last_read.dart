import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/cubits/last_read_cubit/last_read_cubit.dart';

import '../constants.dart';

class LastRead extends StatelessWidget {
  const LastRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastReadCubit, LastReadState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
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
            Positioned(
              bottom: MediaQuery.of(context).size.width < 365 ? -50 : -60,
              right: -50,
              child: Image.asset(
                'assets/svgs/muslim.png',
                width: 250,
                height: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.bookOpen,
                        color: Colors.white,
                        size: 19,
                      ),
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
                    'Aya No: ${prefs.read(kPrefAyaNumber) ?? 1}',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
