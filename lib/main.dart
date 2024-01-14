import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/presentation/themes/clash_of_clans_theme.dart';
import 'package:clash_of_clans_clan_helper/presentation/screens/home/HomeScreen.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/services/environment_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clash of Clans Helper',
      debugShowCheckedModeBanner: false,
      theme: buildClashOfClansTheme(),
      home: FutureBuilder(
        future: EnvironmentService().loadEnv(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
          if (snapshots.connectionState == ConnectionState.done) {
            return HomeScreen();
          } else if (snapshots.hasError) {
            return const Text('Error');
          } else {
            return const Text('LOADING...');
          }
        }
      ),
    );
  }
}
