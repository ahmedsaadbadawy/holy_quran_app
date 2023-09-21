class AyatModel {
  final int? numberinQuran;
  final int? numberinSurah;
  final int? page;
  final int? juz;
  final int? hizbQuarter;
  final String? quran;
  final String? translation;
  final String? audio;
  
  AyatModel({
    required this.numberinQuran,
    required this.numberinSurah,
    required this.page,
    required this.juz,
    required this.hizbQuarter,
    required this.quran,
    required this.translation,
    required this.audio,
  });

  factory AyatModel.fromJson(jsonData) {
    return AyatModel(
      numberinQuran: jsonData['number']['inQuran'],
      numberinSurah: jsonData['number']['inSurah'],
      page: jsonData['meta']['page'],
      juz: jsonData['meta']['juz'],
      hizbQuarter: jsonData['meta']['hizbQuarter'],
      quran: jsonData['text']['arab'],
      translation: jsonData['translation']['en'],
      audio: jsonData['audio']['primary'],

    );
  }
}
