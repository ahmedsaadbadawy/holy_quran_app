part of 'last_read_cubit.dart';

@immutable
sealed class LastReadState {}

final class LastReadInitial extends LastReadState {}

final class LastReadChange extends LastReadState {}
