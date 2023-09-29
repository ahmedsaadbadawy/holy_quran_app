import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class PraiseCustomContainer extends StatefulWidget {
  const PraiseCustomContainer({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  State<PraiseCustomContainer> createState() => _PraiseCustomContainerState();
}

class _PraiseCustomContainerState extends State<PraiseCustomContainer> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, .6, 1],
                colors: [
                  Color(0xFFB691FF),
                  Color(0xFF6918B4),
                  Color(0xFF36117E),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.amiri(
                      color: background,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.subTitle,
                    style: GoogleFonts.amiri(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$number',
                    style: TextStyle(color: background),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            number++;
            setState(() {});
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: primary,
            ),
            child: Icon(
              Icons.add,
              color: background,
            ),
          ),
        ),
      ],
    );
  }
}
