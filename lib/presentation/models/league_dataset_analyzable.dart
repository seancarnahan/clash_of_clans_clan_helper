import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
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
  String getClashOfClansData() {
    return '';
  }

  @override
  String getLlmPrompting() {
    return '';
  }
}
