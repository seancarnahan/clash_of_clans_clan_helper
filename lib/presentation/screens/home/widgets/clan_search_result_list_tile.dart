import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/presentation/screens/clan_dashboard/clan_dashboard_screen.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan_search_result.dart';

class ClanSearchResultListTile extends StatelessWidget {
  final ClanSearchResult clanSearchResult;

  const ClanSearchResultListTile({Key? key, required this.clanSearchResult}) : super(key: key);

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
    return Text(clanSearchResult.name);
  }
}
