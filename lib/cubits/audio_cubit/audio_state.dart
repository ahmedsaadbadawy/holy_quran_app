part of 'audio_cubit.dart';

@immutable
sealed class AudioState {}

final class AudioInitial extends AudioState {}
final class AudioPlay extends AudioState {}
final class AudioPuase extends AudioState {}
final class AudioComplete extends AudioState {}
