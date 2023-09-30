import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Color background = const Color(0xFF040C23);
Color text = const Color(0xFFb691ff);
Color orange = const Color(0xFFF9B091);
Color primary = const Color(0xFF6918b4);
Color gray = const Color(0xFF121931);
Color font = Colors.white;
List<Color> linearGradiant = const [
  Color(0xFFB691FF),
  Color(0xFF6918B4),
  Color(0xFF36117E),
];
final prefs = GetStorage();

String kPrefSurahName = 'surahName';
String kPrefSurahNumber = 'surahNumber';
String kPrefAyaNumber = 'ayaNumber';
String kPrefNumberOfAyat = 'NumberOfAyat';

String kPageTabName = 'PageTap';

int pageNum = 1;
