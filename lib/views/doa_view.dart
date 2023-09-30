import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/doa.dart';

import '../constants.dart';

class DoaView extends StatelessWidget {
  const DoaView({super.key});

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
              icon: const Icon(Icons.menu_outlined),
            ),
            const SizedBox(width: 24),
            Text(
              'Doa',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: font,),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, .6, 1],
                colors:linearGradiant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم",
                    style: GoogleFonts.amiri(
                      color: background,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    doa[index],
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
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
