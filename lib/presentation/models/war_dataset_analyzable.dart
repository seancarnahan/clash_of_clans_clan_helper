import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/war_log.dart';
import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class WarDatasetAnalyzable extends DatasetAnalyzable {

  WarDatasetAnalyzable(Clan clan) : super(clan);

  @override
  AnalyzableDatasetName get datasetName =>  AnalyzableDatasetName.war;

  @override
  String get title => 'War';

  @override
  IconData get icon => Icons.security;

  @override
  Future<String> getClashOfClansData(ClanService clanService) async {
    WarLog warLog = await clanService.getWarLog(clan.tag);

    return WarLog.toJson(warLog);
  }

  @override
  String getLlmPrompting() {
    return 'This is the war log of a clan in clash of clans. Can you pull some interesting insights, trends, and advice from the last couple of wars. Try to be specific and avoid generic terminology or advice.';
  }
}
