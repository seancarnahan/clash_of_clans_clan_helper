import 'dart:convert';

import 'package:clash_of_clans_clan_helper/domain/entities/badge_urls.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/war_clan_member.dart';

class WarClan {
  final double destructionPercentage;
  final String tag;
  final String name;
  final BadgeUrls badgeUrls;
  final int clanLevel;
  final int attacks;
  final int stars;
  final int expEarned;
  final List<WarClanMember> members;

  WarClan({
    required this.destructionPercentage,
    required this.tag,
    required this.name,
    required this.badgeUrls,
    required this.clanLevel,
    required this.attacks,
    required this.stars,
    required this.expEarned,
    required this.members,
  });

  factory WarClan.fromJson(Map<String, dynamic> json) {
    return WarClan(
      destructionPercentage: json['destructionPercentage'],
      tag: json['tag'],
      name: json['name'],
      badgeUrls: BadgeUrls.fromJson(json['badgeUrls']),
      clanLevel: json['clanLevel'],
      attacks: json['attacks'],
      stars: json['stars'],
      expEarned: json['expEarned'],
      members: json.containsKey('members') ? List<WarClanMember>.from(json['members'].map((x) => WarClanMember.fromJson(x))) : [],
    );
  }

  static String toJson(WarClan warClan) {
    Map<String, dynamic> warClanMap = {
      'destructionPercentage': warClan.destructionPercentage,
      'tag': warClan.tag,
      'name': warClan.name,
      'badgeUrls': BadgeUrls.toJson(warClan.badgeUrls),
      'clanLevel': warClan.clanLevel,
      'attacks': warClan.attacks,
      'stars': warClan.stars,
      'expEarned': warClan.expEarned,
      'members': warClan.members.map((member) => WarClanMember.toJson(member)).toList(),
    };
    return jsonEncode(warClanMap);
  }
}
