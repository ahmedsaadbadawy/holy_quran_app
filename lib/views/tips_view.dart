import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/tips.dart';

import '../widgets/tip_item.dart';

// ignore: must_be_immutable
class TipsView extends StatelessWidget {
  const TipsView({super.key});

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
              'Tips',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).highlightColor,
              ),
            ),
          ],
        ),
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
