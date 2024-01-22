import 'dart:convert';

import 'package:clash_of_clans_clan_helper/domain/entities/war_clan.dart';

class WarLog {
  final WarClan clan;
  final WarClan opponent;
  final int? teamSize;
  final int? attacksPerMember;
  final String? endtime;
  final String? result;

  WarLog({
    required this.clan,
    required this.opponent,
    required this.teamSize,
    required this.attacksPerMember,
    required this.endtime,
    required this.result,
  });

  factory WarLog.fromJson(Map<String, dynamic> json) {
    return WarLog(
      clan: WarClan.fromJson(json['clan']),
      opponent: WarClan.fromJson(json['opponent']),
      teamSize: json['teamSize'],
      attacksPerMember: json['attacksPerMember'],
      endtime: json['endTime'],
      result: json['result'],
    );
  }

  static String toJson(WarLog warLog) {
    Map<String, dynamic> warLogMap = {
      'clan': WarClan.toJson(warLog.clan),
      'opponent': WarClan.toJson(warLog.opponent),
      'teamSize': warLog.teamSize,
      'attacksPerMember': warLog.attacksPerMember,
      'endtime': warLog.endtime,
      'result': warLog.result,
    };
    return jsonEncode(warLogMap);
  }
}
