import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

import 'widgets/clan_analysis_tool.dart';
import 'widgets/clan_dashboard_header.dart';
import 'widgets/clan_overview_card.dart';
import 'widgets/clan_war_history_card.dart';

class ClanDashboardScreen extends StatelessWidget {
  final Clan clan;
  
  const ClanDashboardScreen({Key? key, required this.clan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ClanDashboardHeader(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClanOverviewCard(),
                ClanWarHistoryCard()
              ],
            ),
            Expanded(
              child: ClanAnalysisTool(),
            ),
          ],
        )
      )
    );
  }
}
