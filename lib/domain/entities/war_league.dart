import 'dart:convert';

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

  static String toJson(WarLeague warLeague) {
    Map<String, dynamic> warLeagueMap = {
      'name': warLeague.name,
      'id': warLeague.id,
    };
    return jsonEncode(warLeagueMap);
  }
}
