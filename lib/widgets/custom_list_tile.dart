import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: ListTile(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/svgs/nomor-surah.svg'),
            Text(
              '$index',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        title: Text(
          'Al-Fatihah',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          'MEKAH  7 verses',
          style: GoogleFonts.poppins(
              color: text, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        trailing: Text(
          'الفاتحه',
          style: GoogleFonts.amiri(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
