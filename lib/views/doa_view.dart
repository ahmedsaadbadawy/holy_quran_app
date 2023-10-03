import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/doa.dart';

import '../constants.dart';

class DoaView extends StatelessWidget {
  const DoaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(
              'Doa',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: tm == ThemeMode.dark ? Colors.white : primary,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, .6, 1],
                colors: linearGradiant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم",
                    style: GoogleFonts.amiri(
                      color: tm == ThemeMode.dark ? const Color(0xFF121931) : primary,
                      fontSize:
                          MediaQuery.of(context).size.width < 365 ? 18 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    doa[index],
                    style: GoogleFonts.amiri(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width < 365 ?18 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
