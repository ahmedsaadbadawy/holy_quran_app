import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/widgets/azkar_custom_container.dart';

import '../constants.dart';

// ignore: must_be_immutable
class AzkarDetailView extends StatelessWidget {
  const AzkarDetailView({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final List<Map<String, dynamic>> data;

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
            IconButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              icon: Icon(Icons.arrow_back,
                  size: 30, color: tm == ThemeMode.dark ? Colors.white : text),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width < 365 ?18 : 22,
                fontWeight: FontWeight.bold,
                color: tm == ThemeMode.dark ? Colors.white : primary,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: AzkarCustomContainer(
          title: title,
          data: data,
        ),
      ),
    );
  }

}
