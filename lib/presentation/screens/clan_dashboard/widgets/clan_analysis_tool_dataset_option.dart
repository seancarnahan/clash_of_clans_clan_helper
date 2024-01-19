import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/presentation/providers/clan_analysis_tool_provider.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class ClanAnalysisToolDatasetOption extends StatelessWidget {
  final DatasetAnalyzable dataset;
  
  const ClanAnalysisToolDatasetOption({Key? key, required this.dataset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double boxHeight = screenHeight * 0.2;

    return Consumer<ClanAnalysisToolProvider>(
      builder: (context, clanAnalysisToolProvider, child) {
        bool isSelected = clanAnalysisToolProvider.selectedDataset == dataset;
        Color offsetColor = Colors.blueGrey;

        return Card(
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? offsetColor : null,
              border: Border.all(color: Colors.black, width: 1),
            ),
            height: boxHeight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dataset.title, style: const TextStyle(color: Colors.black)),
                    const SizedBox(height: 16),
                    Icon(dataset.icon, color: Colors.blueGrey, size: 48,),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
