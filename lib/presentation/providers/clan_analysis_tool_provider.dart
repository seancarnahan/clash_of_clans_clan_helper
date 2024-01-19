import 'package:flutter/material.dart';

enum ClanAnalysisToolDataset {
  player,
  clan,
  war,
  league,
  location,
}

class ClanAnalysisToolProvider extends ChangeNotifier {
  ClanAnalysisToolDataset? selectedDataset;
  // String llmResponse = 'lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem ';
  String llmResponse = '';
}