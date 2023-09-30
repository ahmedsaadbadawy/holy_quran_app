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
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: AzkarCustomContainer(
          title: title,
          data: data,
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(children: [
        IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            )),
        const SizedBox(
          width: 24,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: font,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: (() => {}),
          icon: const Icon(Icons.search_outlined),
        ),
      ]),
    );
  }
}
