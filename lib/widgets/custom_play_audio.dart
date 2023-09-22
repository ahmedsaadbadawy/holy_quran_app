import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants.dart';
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
  Duration duration = Duration();
  Duration position = Duration();

  Widget customSlider() {
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(Duration(seconds: value.toInt()));
        });
      },
      activeColor: primary,
      inactiveColor: background,
      thumbColor: primary,
    );
  }

  bool playing = false;
  @override
  Widget build(BuildContext context) {
    audioPlayer.onDurationChanged.listen((Duration du) {
      setState(() {
        duration = du;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration du) {
      setState(() {
        position = du;
      });
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration:
          BoxDecoration(color: gray, borderRadius: BorderRadius.circular(22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(27 / 2)),
            child: Center(
                child: Text(
              '${widget.ayat.numberinSurah}',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, color: Colors.white),
            )),
          ),
          const SizedBox(
            height: 2,
          ),
          customSlider(),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (playing == false) {
                  playing = true;
                  audioPlayer.play(UrlSource(widget.ayat.audio.toString()));
                } else {
                  audioPlayer.pause();
                  playing = false;
                }
                //
              });
            },
            child: Icon(
              playing == false
                  ? Icons.play_arrow_outlined
                  : Icons.pause_circle_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
