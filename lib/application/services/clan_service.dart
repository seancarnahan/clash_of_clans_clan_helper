import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/league.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/location.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/member.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/war_log.dart';
import 'package:clash_of_clans_clan_helper/domain/repositories/clan_repository.dart';

class ClanService {
  final ClanRepository clanRepository;

  ClanService(this.clanRepository);

  Future<List<Clan>> searchClans(String name) async {
    return await clanRepository.searchClans(name);
  }

  Future<Clan> fetchClanDetails(String clanTag) async {
    return await clanRepository.getClanDetails(clanTag);
  }

  Future<League> getLeague(String leagueId) async {
    return await clanRepository.getLeague(leagueId);
  }

  Future<Location> getLocation(String locationId) async {
    return await clanRepository.getLocation(locationId);
  }

  Future<List<Member>> getMembers(String clanTag) async {
    return await clanRepository.getMembers(clanTag);
  }

  Future<WarLog> getWarLog(String clanTag) async {
    return await clanRepository.getWarLog(clanTag);
  }
}
