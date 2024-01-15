import 'package:clash_of_clans_clan_helper/domain/entities/badge_urls.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/capital_league.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan_capital.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/label.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/language.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/location.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/member.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/war_league.dart';

class Clan {
  final String tag;
  final int clanBuilderBasePoints;
  final int clanCapitalPoints;
  final int requiredTrophies;
  final int requiredBuilderBaseTrophies;
  final int requiredTownhallLevel;
  final bool isFamilyFriendly;
  final bool isWarLogPublic;
  final String warFrequency;
  final int clanLevel;
  final int warWinStreak;
  final int warWins;
  final int warTies;
  final int warLosses;
  final WarLeague warLeague;
  final int clanPoints;
  final List<Label> labels;
  final String name;
  final String type;
  final int members;
  final String description;
  final BadgeUrls badgeUrls;
  final List<Member> memberList;
  final CapitalLeague capitalLeague;
  final ClanCapital? clanCapital;
  final Location? location;
  final Language? chatLanguage;
  

  Clan({
    required this.tag,
    required this.clanBuilderBasePoints,
    required this.clanCapitalPoints,
    required this.requiredTrophies,
    required this.requiredBuilderBaseTrophies,
    required this.requiredTownhallLevel,
    required this.isFamilyFriendly,
    required this.isWarLogPublic,
    required this.warFrequency,
    required this.clanLevel,
    required this.warWinStreak,
    required this.warWins,
    required this.warTies,
    required this.warLosses,
    required this.warLeague,
    required this.clanPoints,
    required this.labels,
    required this.name,
    required this.type,
    required this.members,
    required this.description,
    required this.badgeUrls,
    required this.memberList,
    required this.capitalLeague,
    this.clanCapital,
    this.location,
    this.chatLanguage,
  });

  factory Clan.fromJson(Map<String, dynamic> json) {
    return Clan(
      tag: json['tag'],
      clanBuilderBasePoints: json['clanBuilderBasePoints'],
      clanCapitalPoints: json['clanCapitalPoints'],
      requiredTrophies: json['requiredTrophies'],
      requiredBuilderBaseTrophies: json['requiredBuilderBaseTrophies'],
      requiredTownhallLevel: json['requiredTownhallLevel'],
      isFamilyFriendly: json['isFamilyFriendly'],
      isWarLogPublic: json['isWarLogPublic'],
      warFrequency: json['warFrequency'],
      clanLevel: json['clanLevel'],
      warWinStreak: json['warWinStreak'] ?? 0,
      warWins: json['warWins'] ?? 0,
      warTies: json['warTies'] ?? 0,
      warLosses: json['warLosses'] ?? 0,
      warLeague: WarLeague.fromJson(json['warLeague']),
      clanPoints: json['clanPoints'] ?? 0,
      labels: List<Label>.from(json['labels'].map((x) => Label.fromJson(x))),
      name: json['name'],
      type: json['type'],
      members: json['members'],
      description: json['description'] ?? '',
      clanCapital: json.containsKey('clanCapital') ? ClanCapital.fromJson(json['clanCapital']) : null,
      badgeUrls: BadgeUrls.fromJson(json['badgeUrls']),
      memberList: json.containsKey('memberList') ? List<Member>.from(json['memberList'].map((x) => Member.fromJson(x))) : [],
      capitalLeague: CapitalLeague.fromJson(json['capitalLeague']),
      location: json.containsKey('location') ? Location.fromJson(json['location']) : null,
      chatLanguage: json.containsKey('chatLanguage') ? Language.fromJson(json['chatLanguage']) : null,
    );
  }
}