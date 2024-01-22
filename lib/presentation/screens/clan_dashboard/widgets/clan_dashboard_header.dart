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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2.0)
                    ),
                    child: const Icon(
                      Icons.house,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Visibility(
                    visible: !isMobile,
                    child: const Text('Home', style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'CustomClashOfClans')),
                  )
                ],
              )
            ),
          ),
        ],
      );
  }
}
