import 'dart:convert';

import 'package:clash_of_clans_clan_helper/domain/entities/district.dart';

class ClanCapital {
  final int capitalHallLevel;
  final List<District> districts;

  ClanCapital({
    required this.capitalHallLevel,
    required this.districts,
  });

  factory ClanCapital.fromJson(Map<String, dynamic> json) {
    return ClanCapital(
      capitalHallLevel: json['capitalHallLevel'],
      districts: json['districts'] != null
          ? List<District>.from(json['districts'].map((x) => District.fromJson(x)))
          : [],
    );
  }

  static String toJson(ClanCapital clanCapital) {
    Map<String, dynamic> capitalLeagueMap = {
      'capitalHallLevel': clanCapital.capitalHallLevel,
      'districts': clanCapital.districts.map((district) => District.toJson(district)).toList(),
    };
    return jsonEncode(capitalLeagueMap);
  }
}