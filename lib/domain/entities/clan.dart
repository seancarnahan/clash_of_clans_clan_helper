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
  final Language chatLanguage;
  final List<Label> labels;
  final String name;
  final Location location;
  final String type;
  final int members;
  final String description;
  final ClanCapital clanCapital;
  final BadgeUrls badgeUrls;
  final List<Member> memberList;
  final CapitalLeague capitalLeague;

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
    required this.chatLanguage,
    required this.labels,
    required this.name,
    required this.location,
    required this.type,
    required this.members,
    required this.description,
    required this.clanCapital,
    required this.badgeUrls,
    required this.memberList,
    required this.capitalLeague,
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
    warWinStreak: json['warWinStreak'],
    warWins: json['warWins'],
    warTies: json['warTies'],
    warLosses: json['warLosses'],
    warLeague: json['warLeague'],
    clanPoints: json['clanPoints'],
    chatLanguage: Language.fromJson(json['Language']),
    labels: List<Label>.from(json['labels'].map((x) => Label.fromJson(x))),
    name: json['name'],
    location: Location.fromJson(json['location']),
    type: json['type'],
    members: json['members'],
    description: json['description'],
    clanCapital: ClanCapital.fromJson(json['clanCapital']),
    badgeUrls: BadgeUrls.fromJson(json['badgeUrls']),
    memberList: List<Member>.from(json['memberList'].map((x) => Member.fromJson(x))),
    capitalLeague: CapitalLeague.fromJson(json['capitalLeague']),
    );
  }
}