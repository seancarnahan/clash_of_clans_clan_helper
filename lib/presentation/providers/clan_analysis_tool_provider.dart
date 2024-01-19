import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/presentation/models/clan_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/league_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/location_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/player_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/war_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

class ClanAnalysisToolProvider extends ChangeNotifier {
  AnalyzableDatasetName? selectedDataset;
  String llmResponse = '';


  void selectDataset(AnalyzableDatasetName dataset) {
    selectedDataset = dataset;
    notifyListeners();
  }

  static List<DatasetAnalyzable> getDatasetOptions(Clan clan) {
    return [
      ClanDatasetAnalyzable(clan),
      LeagueDatasetAnalyzable(clan),
      LocationDatasetAnalyzable(clan),
      PlayerDatasetAnalyzable(clan),
      WarDatasetAnalyzable(clan),
    ];
  }
}