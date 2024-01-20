import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/presentation/models/clan_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/league_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/location_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/members_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/war_dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

class ClanAnalysisToolProvider extends ChangeNotifier {
  AnalyzableDatasetName? selectedDatasetName;
  String llmResponse = '';
  bool isProcessingLlmRequest = false;


  void selectDataset(DatasetAnalyzable dataset, BuildContext context) async {
    bool isNewDataset = selectedDatasetName != dataset.datasetName;
    bool canProcessDatasetLLMRequest = isNewDataset && !isProcessingLlmRequest;

    if (canProcessDatasetLLMRequest) {
      isProcessingLlmRequest = true;
      selectedDatasetName = dataset.datasetName;
      notifyListeners();

      llmResponse = await dataset.processDatasetLLMRequest(context);
      isProcessingLlmRequest = false;
      notifyListeners();
    }
  }

  static List<DatasetAnalyzable> getDatasetOptions(Clan clan) {
    return [
      ClanDatasetAnalyzable(clan),
      LeagueDatasetAnalyzable(clan),
      LocationDatasetAnalyzable(clan),
      MembersDatasetAnalyzable(clan),
      WarDatasetAnalyzable(clan),
    ];
  }
}