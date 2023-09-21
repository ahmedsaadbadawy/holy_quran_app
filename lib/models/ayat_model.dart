class AyatModel {
  final int? numberinQuran;
  final int? numberinSurah;
  final int? page;
  final int? juz;
  final int? hizbQuarter;

  AyatModel({
    required this.numberinQuran,
    required this.numberinSurah,
    required this.page,
    required this.juz,
    required this.hizbQuarter,
  });

  factory AyatModel.fromJson(jsonData) {
    return AyatModel(
      numberinQuran: jsonData['number']['inQuran'],
      numberinSurah: jsonData['number']['inSurah'],
      page: jsonData['meta']['page'],
      juz: jsonData['meta']['juz'],
      hizbQuarter: jsonData['meta']['hizbQuarter'],
    );
  }
}
