import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/presentation/providers/clan_analysis_tool_provider.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

// onHover -> change color to grey, and update elevation
class ClanAnalysisToolDatasetOption extends StatelessWidget {
  final DatasetAnalyzable dataset;
  
  const ClanAnalysisToolDatasetOption({Key? key, required this.dataset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double boxHeight = screenHeight * 0.2;

    return Consumer<ClanAnalysisToolProvider>(
      builder: (context, clanAnalysisToolProvider, child) {
        bool isSelected = clanAnalysisToolProvider.selectedDataset == dataset.datasetName;
        Color? containerColor = isSelected ? Colors.blueGrey : null;
        Color textColor = isSelected ? Colors.white : Colors.black;
        Color iconColor = isSelected ? Colors.white : Colors.blueGrey;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => clanAnalysisToolProvider.selectDataset(dataset.datasetName),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  color: containerColor,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                height: boxHeight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dataset.title, style: TextStyle(color: textColor)),
                        const SizedBox(height: 16),
                        Icon(dataset.icon, color: iconColor, size: 48),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
