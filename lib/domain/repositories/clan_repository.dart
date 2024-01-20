import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/league.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/location.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/member.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/war_log.dart';

abstract class ClanRepository {
  Future<List<Clan>> searchClans(String name);
  Future<Clan> getClanDetails(String clanTag);
  Future<League> getLeague(String leagueId);
  Future<Location> getLocation(String locationId);
  Future<List<Member>> getMembers(String clanTag);
  Future<WarLog> getWarLog(String clanTag);
}
