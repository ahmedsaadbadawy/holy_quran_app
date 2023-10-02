import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/cubits/audio_cubit/audio_cubit.dart';

import '../constants.dart';
import '../models/ayat_model.dart';
import 'custom_play_audio.dart';

class AyatItem extends StatelessWidget {
  const AyatItem({
    super.key,
    required this.ayat,
  });
  final AyatModel ayat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocProvider(
            create: (context) => AudioCubit(),
            child: CustomPlayAudio(ayat: ayat),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            ayat.quran!,
            style: GoogleFonts.amiri(
              color: font,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 16),
          Text(
            ayat.translation!,
            style: GoogleFonts.poppins(
              color: tm == ThemeMode.dark ? text : Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
          Divider(color: const Color(0xFF7B80AD).withOpacity(.3)),
        ],
      ),
    );
  }
}
