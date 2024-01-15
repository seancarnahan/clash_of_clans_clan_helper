class WarLeague {
  final String name;
  final int id;

  WarLeague({required this.name, required this.id});

  factory WarLeague.fromJson(Map<String, dynamic> json) {
    return WarLeague(
      name: json['name'],
      id: json['id'],
    );
  }
}
