import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
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
}
