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
    bool isMobile = MediaQuery.of(context).size.width < 600; // Adjust this threshold as needed

    return Card(
      color: Colors.brown.shade200, // Clash of Clans theme color
      child: ListTile(
        onTap: () => _onClanSelect(clan.tag, context),
        title: Text(
          clan.name,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'Tag: ${clan.tag}\nMembers: ${clan.members}\n${isMobile ? '' : clan.description}',
          style: const TextStyle(color: Colors.white70),
          overflow: TextOverflow.ellipsis,
          maxLines: isMobile ? 2 : 4,
        ),
        leading: CircleAvatar(
          // Placeholder for clan badge, replace with actual image if available
          backgroundColor: Colors.deepOrange,
          child: Text(clan.tag[0]), // First letter of clan tag as placeholder
        ),
      ),
    );
  }
}
