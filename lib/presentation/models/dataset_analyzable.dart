import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

enum AnalyzableDatasetName {
  player,
  clan,
  war,
  league,
  location,
}

abstract class DatasetAnalyzable {
  final Clan clan;

  DatasetAnalyzable(this.clan);

  AnalyzableDatasetName get datasetName;
  String get title;
  IconData get icon;
  String getLlmPrompting();
  String getClashOfClansData();

  void fetchLlmResponse() {
    String sourceData = getClashOfClansData();
    String additionialPrompting = getLlmPrompting();

    // TODO implement OpenAi connection and return response
  }
}