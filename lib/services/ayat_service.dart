import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/ayat_model.dart';

class AyatService {
  Future<List<AyatModel>> getAllAyat({required int surahNumber}) async {
    http.Response response = await http
        .get(Uri.parse('https://api.quran.gading.dev/surah/${surahNumber}'));

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    List<dynamic> ayat = jsonData['data']['verses'];

    List<AyatModel> ayatList = [];

    for (var aya in ayat) {
      ayatList.add(AyatModel.fromJson(aya));
    }

    return ayatList;
  }
}
