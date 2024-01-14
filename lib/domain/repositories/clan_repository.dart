import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan_search_result.dart';

abstract class ClanRepository {
  Future<List<ClanSearchResult>> searchClans(String name);
  Future<Clan> getClanDetails(String clanTag);
}
