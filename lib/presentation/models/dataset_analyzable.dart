import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/application/services/open_ai_service.dart';
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

  Future<String> processDatasetLLMRequest(BuildContext context) async {
    String sourceData = await getClashOfClansData();
    String llmPrompt = getLlmPrompting();
    OpenAIService openAIService = Provider.of<OpenAIService>(context, listen: false);

    return openAIService.analyzeDataset(sourceData, llmPrompt);
  }
}