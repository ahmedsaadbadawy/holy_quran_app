import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class TipItem extends StatelessWidget {
  const TipItem({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final List<String> body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 24,
          ),
          Center(
            child: Text(
              title,
              style: GoogleFonts.amiri(
                color: text,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...body.map(
            (item) => Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  item,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.right,
                ),
                Divider(color: const Color(0xFF7B80AD).withOpacity(.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}