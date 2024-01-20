import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class PlayerDatasetAnalyzable extends DatasetAnalyzable {

  PlayerDatasetAnalyzable(Clan clan) : super(clan);

  @override
  AnalyzableDatasetName get datasetName =>  AnalyzableDatasetName.player;

  @override
  String get title => 'Player';

  @override
  IconData get icon => Icons.person;

  @override
  Future<String> getClashOfClansData() {
    return Future.value("Mock Player");
  }

  @override
  String getLlmPrompting() {
    return '';
  }
}
