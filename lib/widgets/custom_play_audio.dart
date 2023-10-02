import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';
import '../cubits/audio_cubit/audio_cubit.dart';
import '../models/ayat_model.dart';

class CustomPlayAudio extends StatefulWidget {
  const CustomPlayAudio({
    super.key,
    required this.ayat,
  });

  final AyatModel ayat;

  @override
  State<CustomPlayAudio> createState() => _CustomPlayAudioState();
}

class _CustomPlayAudioState extends State<CustomPlayAudio> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration position = const Duration();
  Widget customSlider() {
    return Slider.adaptive(
      min: 0.0,
      value: BlocProvider.of<AudioCubit>(context).position.inSeconds.toDouble(),
      max: BlocProvider.of<AudioCubit>(context).duration.inSeconds.toDouble(),
      onChanged: (_) {},
      activeColor: primary,
      inactiveColor: background,
      thumbColor: primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width - 55,
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                color: tm == ThemeMode.dark
                    ? gray
                    : const Color.fromARGB(255, 228, 226, 232),
                borderRadius: BorderRadius.circular(22)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(27 / 2)),
                  child: Center(
                      child: Text(
                    '${widget.ayat.numberinSurah}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )),
                ),
                const SizedBox(
                  width: 2,
                ),
                customSlider(),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.share_outlined,
                    color: tm == ThemeMode.dark ? Colors.white : primary,
                  ),
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<AudioCubit>(context)
                        .getAudio(url: widget.ayat.audio.toString());
                  },
                  child: Icon(
                    BlocProvider.of<AudioCubit>(context).playing == false
                        ? Icons.play_arrow_outlined
                        : Icons.pause_circle_outlined,
                    color: tm == ThemeMode.dark ? Colors.white : primary,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.bookmark_outline,
                    color: tm == ThemeMode.dark ? Colors.white : primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
