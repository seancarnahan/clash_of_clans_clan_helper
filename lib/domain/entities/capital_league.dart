import 'dart:convert';

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

  static String toJson(CapitalLeague capitalLeague) {
    Map<String, dynamic> capitalLeagueMap = {
      'name': capitalLeague.name,
      'id': capitalLeague.id,
    };
    return jsonEncode(capitalLeagueMap);
  }
}
