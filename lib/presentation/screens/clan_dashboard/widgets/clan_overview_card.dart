import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/constants/app_contants.dart';
import 'package:clash_of_clans_clan_helper/presentation/widgets/clash_of_clans_line_painter.dart';

class ClanOverviewCard extends StatelessWidget {
  final Clan clan;
  
  const ClanOverviewCard({Key? key, required this.clan}) : super(key: key);

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
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(clan.badgeUrls.large),
                      backgroundColor: Colors.grey,
                      radius: isMobile ? 25 : 50,
                    ),
                  )
                ),
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clan.name,
                      style: const TextStyle(color: Colors.black, fontSize: 24)
                    ),
                    const SizedBox(height: 8),
                    CustomPaint(
                      size: const Size(double.infinity, 1),
                      painter: ClashOfClansLinePainter(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Members: ${clan.members}',
                      style: const TextStyle(color: Colors.black54, fontSize: 16)
                    ),
                    const SizedBox(height: 8),
                    Text(
                      clan.location?.name ?? clan.tag,
                      style: const TextStyle(color: Colors.black54, fontSize: 16)
                    ),
                  ],
                ),
              )
            )
          ],
        )
      )
    );
  }
}
