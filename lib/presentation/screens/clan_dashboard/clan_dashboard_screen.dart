import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';

class ClanDashboardScreen extends StatelessWidget {
  final Clan clan;
  
  const ClanDashboardScreen({Key? key, required this.clan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ClanDashboardScreen'),
      ),
    );
  }
}
