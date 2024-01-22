import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/league.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/location.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/member.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/war_log.dart';

import 'package:clash_of_clans_clan_helper/infrastructure/services/environment_service.dart';
import 'package:clash_of_clans_clan_helper/domain/repositories/clan_repository.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

// Singleton
class ClashOfClansApi implements ClanRepository {
  final String baseUrl = 'https://api.clashofclans.com/v1';
  final String apiToken = EnvironmentService().clashOfClansApiKey;

  @override
  Future<List<Clan>> searchClans(String name) async {
    Response? response;
    try {
      response = await http.get(
        Uri.parse('$baseUrl/clans?name=$name'),
        headers: {
          'Authorization': 'Bearer $apiToken',
          "content-type": "application/json"
        },
      );
    } catch (error) {
      throw Exception('Http request for searching clans failed');
    }
    
    if (response.statusCode == 200) {
      try {
        List<dynamic> clansJson = json.decode(response.body)['items'];
        return clansJson.map((clanJson) => Clan.fromJson(clanJson)).toList();
      } catch (error) {
        throw Exception('Unable to parse searched clans result + $error');
      }
    } else {
      throw Exception('Failed to search clans');
    }
  }

  @override
  Future<Clan> getClanDetails(String clanTag) async {
    final response = await http.get(
      Uri.parse('$baseUrl/clans/$clanTag'),
      headers: {
        'Authorization': 'Bearer $apiToken',
      },
    );

    if (response.statusCode == 200) {
      return Clan.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load clan details');
    }
  }

  @override
  Future<League> getLeague(String leagueId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/warleagues/$leagueId'),
      headers: {
        'Authorization': 'Bearer $apiToken',
      },
    );

    if (response.statusCode == 200) {
      return League.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load league details');
    }
  }

  @override
  Future<Location> getLocation(String locationId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/locations/$locationId'),
      headers: {
        'Authorization': 'Bearer $apiToken',
      },
    );

    if (response.statusCode == 200) {
      return Location.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load location details');
    }
  }

  @override
  Future<List<Member>> getMembers(String clanTag) async {
    final Uri uri = Uri.parse('$baseUrl/clans/$clanTag/members'.replaceAll('#', '%23'));
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $apiToken',
      },
    );

    if (response.statusCode == 200) {
      return [];
    } else {
      throw Exception('Failed to load member details');
    }
  }

  @override
  Future<WarLog> getWarLog(String clanTag) async {
    final Uri uri = Uri.parse('$baseUrl/clans/$clanTag/warlog'.replaceAll('#', '%23'));
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $apiToken',
      },
    );

    if (response.statusCode == 200) {
      return WarLog.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load war log details');
    }
  }
}
