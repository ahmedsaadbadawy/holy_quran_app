import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/widgets/praise_custom_container.dart';

import '../constants.dart';
import '../models/praise.dart';

class PraiseView extends StatelessWidget {
  const PraiseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: gray,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(
              'Praise',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: tm == ThemeMode.dark ? Colors.white : primary,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: praise.length,
        itemBuilder: (context, index) {
          return PraiseCustomContainer(
            title: praise[index]['title'],
            subTitle: praise[index]['subTitle'],
          );
        },
      ),
    );
  }
}
