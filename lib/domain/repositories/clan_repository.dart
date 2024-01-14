import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

abstract class ClanRepository {
  Future<Clan> getClanDetails(String clanTag);
}
