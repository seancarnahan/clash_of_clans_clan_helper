class Language {
  final String name;
  final int id;
  final String languageCode;

  Language({
    required this.name,
    required this.id,
    required this.languageCode,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
      id: json['id'],
      languageCode: json['languageCode'],
    );
  }
}