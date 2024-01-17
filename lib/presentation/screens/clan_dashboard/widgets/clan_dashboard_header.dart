import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/constants/app_contants.dart';

class ClanDashboardHeader extends StatelessWidget {
  const ClanDashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = screenWidth < AppConstants.mobileOrTabletBreakpoint;
    double imageHeight = screenHeight * 0.3;
    double cardWidthScalar = isMobile ? 0.4 : 0.32;


    return Stack(
        children: <Widget>[
          SizedBox(
            width: screenWidth,
            height: imageHeight,
            child: const Image(
              image: AssetImage('assets/clash-of-clans-header-background.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 25,
            top: imageHeight * 0.1,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Card(
                  child: Container(
                    width: screenWidth * cardWidthScalar,
                    height: imageHeight * 0.4,
                    padding: const EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                            child: const Icon(
                              Icons.replay,
                              size: 24,
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text('Home'),
                        )
                      ],
                    )
                  ),
                ),
              ),
            )
          ),
        ],
      );
  }
}
