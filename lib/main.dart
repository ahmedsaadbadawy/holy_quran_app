import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_app/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'constants.dart';
import 'views/splash_view.dart';

void main() async {
  await GetStorage.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit()..changeTheme(ThemeState.initial),
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          if (state is ChangeThemeLight) {
            tm = ThemeMode.system;

            linearGradiant = const [
              Color.fromARGB(255, 166, 129, 241),
              Color.fromARGB(255, 166, 129, 241),
              Color(0xFF6918B4),
            ];
          } else {
            tm = ThemeMode.dark;
            linearGradiant = const [
              Color(0xFFB691FF),
              Color(0xFF6918B4),
              Color(0xFF36117E),
            ];
          }
          return MaterialApp(
            themeMode: tm,
            theme: ThemeData(
              //gray
              // ignore: deprecated_member_use
              backgroundColor: const Color(0xFFFAF8FC),
              //Background
              scaffoldBackgroundColor: const Color(0xFFFAF8FC),
              //font
              primaryColor: Colors.black,
              //text
              hintColor: const Color.fromARGB(255, 130, 128, 128),
              //header
              highlightColor: const Color(0xFF6918b4),
            ),
            darkTheme: ThemeData(
              //gray
              // ignore: deprecated_member_use
              backgroundColor: const Color(0xFF121931),
              //Background
              scaffoldBackgroundColor: const Color(0xFF040C23),
              //font
              primaryColor: Colors.white,
              //text
              hintColor: const Color(0xFFb691ff),
              //header
              highlightColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
