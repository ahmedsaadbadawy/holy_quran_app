class SurahModel {
  final int? number;
  final int? numberOfVerses;
  final String? name;
  final String? enName;
  final String? revelation;

  SurahModel({
    required this.number,
    required this.numberOfVerses,
    required this.name,
    required this.enName,
    required this.revelation,
  });

  factory SurahModel.fromJson(jsonData) {
    return SurahModel(
      number: jsonData['number'],
      numberOfVerses: jsonData['numberOfVerses'],
      name: jsonData['name']['short'],
      enName: jsonData['name']['transliteration']['id'],
      revelation: jsonData['revelation']['en'],
    );
  }
}
