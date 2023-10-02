import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'constants.dart';
import 'views/splash_view.dart';

void main() {
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
            gray = const Color(0xFFFAF8FC);
            background = const Color(0xFFFAF8FC);
            text = const Color.fromARGB(255, 130, 128, 128);
            font = Colors.black;
            linearGradiant = const [
              Color.fromARGB(255, 166, 129, 241),
              Color.fromARGB(255, 166, 129, 241),
              Color(0xFF6918B4),
            ];
          } else {
            background = const Color(0xFF040C23);
            text = const Color(0xFFb691ff);
            orange = const Color(0xFFF9B091);
            gray = const Color(0xFF121931);
            font = Colors.white;
            linearGradiant = const [
              Color(0xFFB691FF),
              Color(0xFF6918B4),
              Color(0xFF36117E),
            ];
            tm = ThemeMode.dark;
          }
          return const MaterialApp(
            // themeMode: tm,
            // theme: ThemeData(
            //   primaryColor: Colors.green,
            //   backgroundColor: Colors.greenAccent,
            //   scaffoldBackgroundColor: Colors.white,
            //   canvasColor: Colors.black,
            //   hintColor: Colors.greenAccent,
            // ),
            // darkTheme: ThemeData(
            //   //primary
            //   primaryColor: const Color(0xFF6918b4),
            //   //gray
            //   backgroundColor: const Color(0xFF121931),
            //   //Background
            //   scaffoldBackgroundColor: const Color(0xFF040C23),
            //   //font
            //   canvasColor: Colors.white,
            //   //text
            //   hintColor: const Color(0xFFb691ff),
            // ),
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          );
        },
      ),
    );
  }
}
