import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran_app/cubits/change_theme_cubit/change_theme_cubit.dart';
import 'constants.dart';
import 'cubits/last_read_cubit/last_read_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ChangeThemeCubit()..changeTheme(ThemeState.initial),
        ),
        BlocProvider(
          create: (context) => LastReadCubit(),
        ),
      ],
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
              backgroundColor: const Color(0xFFFAF8FC),
              scaffoldBackgroundColor: const Color(0xFFFAF8FC),
              primaryColor: Colors.black,
              hintColor: const Color.fromARGB(255, 130, 128, 128),
              highlightColor: const Color(0xFF6918b4),
            ),
            darkTheme: ThemeData(
              backgroundColor: const Color(0xFF121931),
              scaffoldBackgroundColor: const Color(0xFF040C23),
              primaryColor: Colors.white,
              hintColor: const Color(0xFFb691ff),
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
