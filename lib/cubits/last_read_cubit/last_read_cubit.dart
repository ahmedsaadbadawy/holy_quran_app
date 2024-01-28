import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:quran_app/constants.dart';

part 'last_read_state.dart';

class LastReadCubit extends Cubit<LastReadState> {
  LastReadCubit() : super(LastReadInitial());
  changeLastRead({required int ayaNum, required String surahName})async {
    await prefs.write(kPrefSurahName, surahName);
    await prefs.write(kPrefAyaNumber, ayaNum);
    emit(LastReadChange());
  }
}
