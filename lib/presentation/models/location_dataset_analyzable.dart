import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class LocationDatasetAnalyzable extends DatasetAnalyzable {

  LocationDatasetAnalyzable(Clan clan) : super(clan);

  @override
  AnalyzableDatasetName get datasetName =>  AnalyzableDatasetName.location;

  @override
  String get title => 'Location';

  @override
  IconData get icon => Icons.location_on;

  @override
  String getClashOfClansData() {
    return '';
  }

  @override
  String getLlmPrompting() {
    return '';
  }
}
