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
              'Praise',
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
