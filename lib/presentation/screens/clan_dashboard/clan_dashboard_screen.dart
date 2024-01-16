import 'package:flutter/material.dart';

class ClanDashboardScreen extends StatelessWidget {
  final String clanTag;
  
  const ClanDashboardScreen({Key? key, required this.clanTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ClanDashboardScreen'),
      ),
    );
  }
}
