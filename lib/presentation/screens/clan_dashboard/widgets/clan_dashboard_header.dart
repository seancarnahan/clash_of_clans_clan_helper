import 'package:flutter/material.dart';

class ClanDashboardHeader extends StatelessWidget {
  const ClanDashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.2, // 1/5 of the screen height
            child: Image.asset(
              'assets/background.jpg', // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.1, // Center of the background image
            child: Card(
              child: Container(
                width: 200, // Set your desired width
                height: 100, // Set your desired height
                padding: EdgeInsets.all(16),
                child: Text('Your Content Here'),
              ),
            ),
          ),
        ],
      );
  }
}
