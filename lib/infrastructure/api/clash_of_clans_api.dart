import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:clash_of_clans_clan_helper/infrastructure/services/environment_service.dart';
import 'package:clash_of_clans_clan_helper/domain/repositories/clan_repository.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';


// Singleton
class ClashOfClansApi implements ClanRepository {
  final String baseUrl = 'https://api.clashofclans.com/v1';
  final String apiToken = EnvironmentService().clashOfClansApiKey;
  final int searchedClansResultLimit = 100;

  @override
  Future<List<Clan>> searchClans(String name) async {
    Response? response;
    try {
      response = await http.get(
        Uri.parse('$baseUrl/clans?name=$name&limit=$searchedClansResultLimit'),
        headers: {
          'Authorization': 'Bearer $apiToken',
          "content-type": "application/json"
        },
      );
    } catch (error) {
      print(error);
      throw Exception('Http request for searching clans failed');
    }
    
    if (response.statusCode == 200) {
      try {
        List<dynamic> clansJson = json.decode(response.body)['items'];
        return clansJson.map((clanJson) => Clan.fromJson(clanJson)).toList();
      } catch (error) {
        print(error);
        throw Exception('Unable to parse searched clans result + $error');
      }
    } else {
      print(response.body);
      print(response.statusCode);
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
}