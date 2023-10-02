import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  changeTheme(ThemeState state) async {
    if (state == ThemeState.initial) {
      if (prefs.read('ThemeMode') != null) {
        if (prefs.read('ThemeMode') == 'light') {
          emit(ChangeThemeLight());
        } else {
          emit(ChangeThemeDark());
        }
      }
    } else if (state == ThemeState.light) {
      await prefs.write('ThemeMode', 'light');
      emit(ChangeThemeLight());
    } else if (state == ThemeState.dark) {
      await prefs.write('ThemeMode', 'dark');
      emit(ChangeThemeDark());
    }
  }
}
