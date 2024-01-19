import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/constants/app_contants.dart';

import 'widgets/clan_analysis_tool.dart';
import 'widgets/clan_dashboard_header.dart';
import 'widgets/clan_overview_card.dart';
import 'widgets/clan_war_history_card.dart';

class ClanDashboardScreen extends StatelessWidget {
  final Clan clan;
  
  const ClanDashboardScreen({Key? key, required this.clan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < AppConstants.mobileOrTabletBreakpoint;
    double cardHeight = (screenHeight * 0.3) * 0.5;
    double horizontalScreenPadding = isMobile ? 12 : 25;
    double imageHeight = screenHeight * 0.3;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const ClanDashboardHeader(),
                Positioned(
                  top: imageHeight - (cardHeight * 0.75),
                  left: horizontalScreenPadding,
                  right: horizontalScreenPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClanOverviewCard(clan: clan),
                      ClanWarHistoryCard(clan: clan),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: (cardHeight * 0.25) + horizontalScreenPadding,
                  left: horizontalScreenPadding,
                ),
                child: ClanAnalysisTool(clan: clan),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
