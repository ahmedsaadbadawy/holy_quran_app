import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'last_read.dart';

class Greetings extends StatelessWidget {
  const Greetings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            'Assalamualaikum',
            style: GoogleFonts.poppins(
              color: tm == ThemeMode.dark ? primary : Colors.black,
              fontSize: MediaQuery.of(context).size.width < 365 ? 18 : 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          const LastRead(),
        ],
      ),
    );
  }
}
