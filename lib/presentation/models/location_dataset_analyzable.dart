import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/location.dart';
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
  Future<String> getClashOfClansData(ClanService clanService) async {
    String? locationId = clan.location?.id.toString();

    if (locationId != null) {
      Location location = await clanService.getLocation(locationId);

      return Location.toJson(location);
    }

    return Future.value("This Clan does not have a listed location");
  }

  @override
  String getLlmPrompting() {
    return 'This is the location of a clan from clash of clans. Can you pull some interesting insights, trends, and advice from this location. Try to be specific and avoid generic terminology or advice.';
  }
}
