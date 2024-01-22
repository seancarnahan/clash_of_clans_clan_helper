import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/member.dart';
import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class MembersDatasetAnalyzable extends DatasetAnalyzable {

  MembersDatasetAnalyzable(Clan clan) : super(clan);

  @override
  AnalyzableDatasetName get datasetName =>  AnalyzableDatasetName.player;

  @override
  String get title => 'Members';

  @override
  IconData get icon => Icons.person;

  @override
  Future<String> getClashOfClansData(ClanService clanService) async {
    List<Member> members = await clanService.getMembers(clan.tag);

    return jsonEncode({
      'members': members.sublist(0, 25).map((member) => Member.toJson(member)).toList(),
    });
  }

  @override
  String getLlmPrompting() {
    return 'This is a list of members of a clan from clash of clans. Can you pull some interesting insights, trends, and advice from these members. Try to be specific and avoid generic terminology or advice.';
  }
}
