import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/constants/app_contants.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:flutter/rendering.dart';

class ClanWarHistoryCard extends StatelessWidget {
  final Clan clan;

  const ClanWarHistoryCard({Key? key, required this.clan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < AppConstants.mobileOrTabletBreakpoint;
    double cardWidthScalar = isMobile ? 0.45 : 0.40;

    return SizedBox(
      width: screenWidth * cardWidthScalar,
      height: (screenHeight * 0.3) * 0.5,
      child: const Card(
        child: Text('War card')
      )
    );
  }
}
