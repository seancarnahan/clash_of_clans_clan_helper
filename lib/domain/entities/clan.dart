class Clan {
  final String name;
  final int level;

  Clan({required this.name, required this.level});

  factory Clan.fromJson(Map<String, dynamic> json) {
    return Clan(
      name: json['name'],
      level: json['level'],
    );
  }
}