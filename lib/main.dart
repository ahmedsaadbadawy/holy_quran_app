import 'package:flutter/material.dart';
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
    return const MaterialApp(
      title: 'Flutter Demo',
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
  }
}
