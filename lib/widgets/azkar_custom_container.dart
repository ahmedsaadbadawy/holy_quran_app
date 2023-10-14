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
                      if (zekr['basmalah'] != null)
                        Text(
                          zekr['basmalah'],
                          style: GoogleFonts.amiri(
                            color: primary,
                            fontSize: MediaQuery.of(context).size.width < 365
                                ? 18
                                : 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      const SizedBox(height: 16),
                      Text(
                        zekr['body'],
                        style: GoogleFonts.amiri(
                          color: Colors.black,
                          fontSize:
                              MediaQuery.of(context).size.width < 365 ? 16 : 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                      const SizedBox(height: 12),
                      if (zekr['subtitle'] != null)
                        Text(
                          zekr['subtitle'],
                          style: GoogleFonts.amiri(
                            color: tm == ThemeMode.dark
                                ? const Color(0xFF121931)
                                : const Color.fromARGB(255, 19, 27, 56),
                            fontSize: MediaQuery.of(context).size.width < 365
                                ? 10
                                : 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      Text(
                        zekr['number'].toString(),
                        style: GoogleFonts.amiri(
                          color: Theme.of(context).primaryColor,
                          fontSize:
                              MediaQuery.of(context).size.width < 365 ? 18 : 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
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
