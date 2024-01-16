import 'dart:convert';

class District {
  final String name;
  final int id;
  final int districtHallLevel;

  District({
    required this.name,
    required this.id,
    required this.districtHallLevel,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      name: json['name'],
      id: json['id'],
      districtHallLevel: json['districtHallLevel'],
    );
  }

  static String toJson(District district) {
    Map<String, dynamic> districtMap = {
      'name': district.name,
      'id': district.id,
      'districtHallLevel': district.districtHallLevel,
    };
    return jsonEncode(districtMap);
  }
}
