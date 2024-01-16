import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/presentation/screens/clan_dashboard/clan_dashboard_screen.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';


class ClanSearchResultListTile extends StatelessWidget {
  final Clan clan;

  const ClanSearchResultListTile({Key? key, required this.clan}) : super(key: key);

  void _onClanSelect(String? tag, BuildContext context) {
    if (tag != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClanDashboardScreen(clanTag: tag)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown.shade200,
      child: ListTile(
        onTap: () => _onClanSelect(clan.tag, context),
        title: Text(
          clan.name,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'Tag: ${clan.tag}',
          style: const TextStyle(color: Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          'Members: ${clan.members}',
          style: const TextStyle(color: Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(clan.badgeUrls.small),
          backgroundColor: Colors.deepOrange,
          child: Text(clan.name[0]),
        ),
      ),
    );
  }
}
