class CapitalLeague {
  final String name;
  final int id;

  CapitalLeague({
    required this.name,
    required this.id,
  });

  factory CapitalLeague.fromJson(Map<String, dynamic> json) {
    return CapitalLeague(
      name: json['name'],
      id: json['id'],
    );
  }
}
