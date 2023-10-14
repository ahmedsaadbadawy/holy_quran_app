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
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0, .6, 1],
                colors: linearGradiant,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.amiri(
                      color: tm == ThemeMode.dark
                          ? const Color(0xFF121931)
                          : primary,
                      fontSize:
                          MediaQuery.of(context).size.width < 365 ? 18 : 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.subTitle,
                    style: GoogleFonts.amiri(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$number',
                    style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor),
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
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
