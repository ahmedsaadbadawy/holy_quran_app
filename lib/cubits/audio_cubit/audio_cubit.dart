import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioInitial());
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool playing = false;

  void getAudio({required String url}) async {
    try {
      emit(AudioInitial());
      if (playing == false) {
        playing = true;
        await audioPlayer.play(UrlSource(url));
        duration = (await audioPlayer.getDuration())!;
      } else {
        audioPlayer.pause();
        playing = false;
        emit(AudioPuase());
      }

      audioPlayer.onPositionChanged.listen((Duration du) {
        position = du;
        emit(AudioPlay());
      });
    } catch (e) {
      // ignore: avoid_print
      print('error = $e');
    }

    audioPlayer.onPlayerComplete.listen((_) {
      playing = false;
      emit(AudioComplete());
    });
  }
}
