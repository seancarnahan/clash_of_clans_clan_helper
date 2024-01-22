import 'dart:convert';

import 'package:clash_of_clans_clan_helper/domain/entities/war_clan_member_attack.dart';

class WarClanMember {
  final String? tag;
  final String? name;
  final int? mapPosition;
  final int? townhallLevel;
  final int? opponentAttacks;
  final WarClanMemberAttack bestOpponentAttack;
  final List<WarClanMemberAttack> attacks;

  WarClanMember({
    required this.tag,
    required this.name,
    required this.mapPosition,
    required this.townhallLevel,
    required this.opponentAttacks,
    required this.bestOpponentAttack,
    required this.attacks,
  });

  factory WarClanMember.fromJson(Map<String, dynamic> json) {
    return WarClanMember(
      tag: json['tag'],
      name: json['name'],
      mapPosition: json['mapPosition'],
      townhallLevel: json['townhallLevel'],
      opponentAttacks: json['opponentAttacks'],
      bestOpponentAttack: WarClanMemberAttack.fromJson(json['bestOpponentAttack']),
      attacks: List<WarClanMemberAttack>.from(json['attacks'].map((x) => WarClanMemberAttack.fromJson(x))),
    );
  }

  static String toJson(WarClanMember warClanMember) {
    Map<String, dynamic> warClanMemberMap = {
      'tag': warClanMember.tag,
      'name': warClanMember.name,
      'mapPosition': warClanMember.mapPosition,
      'townhallLevel': warClanMember.townhallLevel,
      'opponentAttacks': warClanMember.opponentAttacks,
      'bestOpponentAttack': WarClanMemberAttack.toJson(warClanMember.bestOpponentAttack),
      'attacks': warClanMember.attacks.map((warClanMemberAttack) => WarClanMemberAttack.toJson(warClanMemberAttack)).toList(),
    };

    return jsonEncode(warClanMemberMap);
  }
}
