import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran_app/models/surah_model.dart';

class SurahService {
  Future<List<SurahModel>> getAllSurahs() async {
    var response =
        await rootBundle.loadString('assets/data/surah.json');

    Map<String, dynamic> jsonData = jsonDecode(response);

    List<dynamic> surahs = jsonData['data'];

    List<SurahModel> surahsList = [];

    for (var surah in surahs) {
      surahsList.add(SurahModel.fromJson(surah));
    }

    return surahsList;
  }
}
