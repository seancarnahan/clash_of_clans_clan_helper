import 'package:flutter/material.dart';

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
  Future<String> getClashOfClansData() {
    return Future.value("Mock War");
  }

  @override
  String getLlmPrompting() {
    return '';
  }
}
