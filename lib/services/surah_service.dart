import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_app/models/surah_model.dart';

class SurahService {
  Future<List<SurahModel>> getAllSurahs() async {
    http.Response response =
        await http.get(Uri.parse('https://api.quran.gading.dev/surah'));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    List<dynamic> surahs = jsonData['data'];

    List<SurahModel> surahsList = [];

    for (var surah in surahs) {
      surahsList.add(SurahModel.fromJson(surah));
    }

    return surahsList;
  }
}
