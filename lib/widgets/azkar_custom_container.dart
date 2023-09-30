import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

// ignore: must_be_immutable
class AzkarCustomContainer extends StatefulWidget {
  const AzkarCustomContainer({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final List<Map<String, dynamic>> data;

  @override
  State<AzkarCustomContainer> createState() => _AzkarCustomContainerState();
}

class _AzkarCustomContainerState extends State<AzkarCustomContainer> {
  late int current;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.data.map(
          (zekr) {
            current = zekr['number'];
            return Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
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
                      if (zekr['basmalah'] != null)
                        Text(
                          zekr['basmalah'],
                          style: GoogleFonts.amiri(
                            color: background,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      const SizedBox(height: 16),
                      Text(
                        zekr['body'],
                        style: GoogleFonts.amiri(
                          color: font,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 12),
                      if (zekr['subtitle'] != null)
                        Text(
                          zekr['subtitle'],
                          style: GoogleFonts.amiri(
                            color: background,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      Text(
                        zekr['number'].toString(),
                        style: GoogleFonts.amiri(
                          color: font,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
