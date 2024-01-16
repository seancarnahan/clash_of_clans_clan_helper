import 'dart:convert';

import 'package:clash_of_clans_clan_helper/domain/entities/league.dart';

class Member {
  final League league;
  final String tag;
  final String name;
  final String role;
  final int townHallLevel;
  final int expLevel;
  final int clanRank;
  final int previousClanRank;
  final int donations;
  final int donationsReceived;
  final int trophies;
  // Add builderBaseTrophies, builderBaseLeague, playerHouse if needed

  Member({
    required this.league,
    required this.tag,
    required this.name,
    required this.role,
    required this.townHallLevel,
    required this.expLevel,
    required this.clanRank,
    required this.previousClanRank,
    required this.donations,
    required this.donationsReceived,
    required this.trophies,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      league: League.fromJson(json['league'] ?? {}),
      tag: json['tag'],
      name: json['name'],
      role: json['role'],
      townHallLevel: json['townHallLevel'],
      expLevel: json['expLevel'],
      clanRank: json['clanRank'],
      previousClanRank: json['previousClanRank'],
      donations: json['donations'],
      donationsReceived: json['donationsReceived'],
      trophies: json['trophies'],
    );
  }

  static String toJson(Member member) {
    Map<String, dynamic> memberMap = {
      'league': League.toJson(member.league),
      'tag': member.tag,
      'name': member.name,
      'role': member.role,
      'townHallLevel': member.townHallLevel,
      'expLevel': member.expLevel,
      'clanRank': member.clanRank,
      'previousClanRank': member.previousClanRank,
      'donations': member.donations,
      'donationsReceived': member.donationsReceived,
      'trophies': member.trophies,
    };
    return jsonEncode(memberMap);
  }
}