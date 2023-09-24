import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Color background = const Color(0xFF040C23);
Color text = const Color(0xFFb691ff);
Color orange = const Color(0xFFF9B091);
Color primary = const Color(0xFF6918b4);
Color gray = const Color(0xFF121931);
//36117e

final prefs = GetStorage();

String kPrefSurahName = 'surahName';
String kPrefSurahNumber = 'surahNumber';
String kPrefAyaNumber = 'ayaNumber';
String kPrefNumberOfAyat = 'NumberOfAyat';

int pageNum = 1;
String pageText = '';
