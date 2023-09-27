import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/ayat_model.dart';

class AyatService {
  Future<List<AyatModel>> getAllAyat({required int surahNumber}) async {
    var response =
        await rootBundle.loadString('assets/data/surah/$surahNumber.json');

    Map<String, dynamic> jsonData = jsonDecode(response);

    List<dynamic> ayat = jsonData['data']['verses'];

    List<AyatModel> ayatList = [];

    for (var aya in ayat) {
      ayatList.add(AyatModel.fromJson(aya));
    }

    return ayatList;
  }
}
