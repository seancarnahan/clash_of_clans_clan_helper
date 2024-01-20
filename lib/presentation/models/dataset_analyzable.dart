import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/application/services/open_ai_service.dart';
import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
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
  Future<String> getClashOfClansData(ClanService clanService);

  Future<String> processDatasetLLMRequest(BuildContext context) async {
    OpenAIService openAIService = Provider.of<OpenAIService>(context, listen: false);
    ClanService clanService = Provider.of<ClanService>(context, listen: false);
    String sourceData = await getClashOfClansData(clanService);
    String llmPrompt = getLlmPrompting();


    return openAIService.analyzeDataset(sourceData, llmPrompt);
  }
}