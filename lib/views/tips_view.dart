import 'package:flutter/material.dart';
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
              icon: const Icon(Icons.menu_outlined),
            ),
            const SizedBox(width: 24),
            Text(
              'Tips',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: font,
              ),
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
      body: ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index) {
          return TipItem(
            title: tips[index]['title'],
            body: tips[index]['body'],
          );
        },
      ),
    );
  }
}
