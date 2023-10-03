import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Color orange = const Color(0xFFF9B091);
Color primary = const Color(0xFF6918b4);
List<Color> linearGradiant = const [
  Color(0xFFB691FF),
  Color(0xFF6918B4),
  Color(0xFF36117E),
];
final prefs = GetStorage();

String kPrefSurahName = 'surahName';
String kPrefSurahNumber = 'surahNumber';
String kPrefAyaNumber = 'ayaNumber';

String kPageTabName = 'PageTap';

int pageNum = 1;

enum ThemeState { initial, light, dark }

ThemeMode tm = ThemeMode.dark;
