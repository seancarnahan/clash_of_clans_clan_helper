import 'dart:convert';

class WarClanMemberAttack {
  final int? order;
  final String? attackerTag;
  final String? defenderTag;
  final int? stars;
  final double? destructionPercentage;
  final int? duration;

  WarClanMemberAttack({
    required this.order,
    required this.attackerTag,
    required this.defenderTag,
    required this.stars,
    required this.destructionPercentage,
    required this.duration,
  });

  factory WarClanMemberAttack.fromJson(Map<String, dynamic> json) {
    return WarClanMemberAttack(
      order: json['order'],
      attackerTag: json['attackerTag'],
      defenderTag: json['defenderTag'],
      stars: json['stars'],
      destructionPercentage: json['destructionPercentage'],
      duration: json['duration']
    );
  }

  static String toJson(WarClanMemberAttack warClanMemberAttack) {
    Map<String, dynamic> warClanMemberAttackMap = {
      'order': warClanMemberAttack.order,
      'attackerTag': warClanMemberAttack.attackerTag,
      'defenderTag': warClanMemberAttack.defenderTag,
      'stars': warClanMemberAttack.stars,
      'destructionPercentage': warClanMemberAttack.destructionPercentage,
      'duration': warClanMemberAttack.duration,
    };

    return jsonEncode(warClanMemberAttackMap);
  }
}
