import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              icon: SvgPicture.asset('assets/svgs/menu-icon.svg'),
            ),
            const SizedBox(width: 24),
            Text(
              'Praise',
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
