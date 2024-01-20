import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/league.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class LeagueDatasetAnalyzable extends DatasetAnalyzable {

  LeagueDatasetAnalyzable(Clan clan) : super(clan);

  @override
  AnalyzableDatasetName get datasetName =>  AnalyzableDatasetName.league;

  @override
  String get title => 'League';

  @override
  IconData get icon => Icons.emoji_events;

  @override
  Future<String> getClashOfClansData(ClanService clanService) async {
    League league = await clanService.getLeague(clan.warLeague.id.toString());

    return League.toJson(league);
  }

  @override
  String getLlmPrompting() {
    return 'This is a league that a clan is in from clash of clans. Can you pull some interesting insights, trends, and advice from this league to help my clan completely demolish in this league. Try to be specific and avoid generic terminology or advice.';
  }
}
