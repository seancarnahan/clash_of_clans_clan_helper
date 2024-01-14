import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:clash_of_clans_clan_helper/domain/repositories/clan_repository.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

class ClashOfClansApi implements ClanRepository {
  final String baseUrl = 'https://api.clashofclans.com/v1';
  final String apiToken = 'your_api_token_here'; // Secure your token

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