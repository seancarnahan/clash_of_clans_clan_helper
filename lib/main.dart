import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/application/services/clan_service.dart';
import 'package:clash_of_clans_clan_helper/presentation/themes/clash_of_clans_theme.dart';
import 'package:clash_of_clans_clan_helper/presentation/screens/home/home_screen.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/services/environment_service.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/api/clash_of_clans_api.dart';
import 'package:clash_of_clans_clan_helper/application/services/open_ai_service.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/api/open_ai_api.dart';

void main() {
  runApp(
    // Dependency Injection for these Services
    MultiProvider(
      providers: [
        // Clan Service
        Provider(create: (_) => ClashOfClansApi()),
        ProxyProvider<ClashOfClansApi, ClanService>(
          update: (_, api, __) => ClanService(api),
        ),

        // Open AI Service
        Provider(create: (_) => OpenAIApi()),
        ProxyProvider<OpenAIApi, OpenAIService>(
          update: (_, api, __) => OpenAIService(api)
        ),
      ],
      child: const MyApp(),
    )
  );
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
            return const HomeScreen();
          } else if (snapshots.hasError) {
            return const Text('Error loading env vars');
          } else {
            return const Scaffold(
              body: Center(
                child: Text('LOADING...'),
              ),
            );
          }
        }
      ),
    );
  }
}
