import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/presentation/providers/clan_analysis_tool_provider.dart';
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
  Future<String> getClashOfClansData();

  Future<String> processDatasetLLMRequest() async {
    String sourceData = await getClashOfClansData();
    String additionialPrompting = getLlmPrompting();

    // TODO implement OpenAi connection and return response
    return Future.delayed(const Duration(seconds: 2), () => "mock LLM Response");
  }
}