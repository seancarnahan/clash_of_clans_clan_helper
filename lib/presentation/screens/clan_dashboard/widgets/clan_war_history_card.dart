import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/constants/app_contants.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/presentation/widgets/clash_of_clans_line_painter.dart';

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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('War League', style: TextStyle(color: Colors.black, fontSize: 24)),
              const SizedBox(height: 8),
               CustomPaint(
                size: const Size(double.infinity, 1),
                painter: ClashOfClansLinePainter(),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Wins: 100', style: TextStyle(color: Colors.black54, fontSize: 16)),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text('Ties: 100', style: TextStyle(color: Colors.black54, fontSize: 16)),
                  )
                ],
              ),
              const SizedBox(height: 8),
              const Text('Losses: 100', style: TextStyle(color: Colors.black54, fontSize: 16)),
            ],
          ),
        )
      )
    );
  }
}
