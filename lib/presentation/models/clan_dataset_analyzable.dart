import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class ClanDatasetAnalyzable extends DatasetAnalyzable {

  ClanDatasetAnalyzable(Clan clan) : super(clan);

  @override
  AnalyzableDatasetName get datasetName =>  AnalyzableDatasetName.clan;

  @override
  String get title => 'Clan';

  @override
  IconData get icon => Icons.shield;

  @override
  Future<String> getClashOfClansData(ClanService clanService) {
    return Future.value(Clan.toJson(clan));
  }

  @override
  String getLlmPrompting() {
    return 'This is a clan from clash of clans. Can you pull some interesting insights, trends, and advice from this clan to help them improve. Try to be specific and avoid generic terminology or advice.';
  }
}
