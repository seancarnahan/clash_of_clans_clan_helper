import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/presentation/providers/clan_analysis_tool_provider.dart';
import 'package:clash_of_clans_clan_helper/presentation/models/dataset_analyzable.dart';

class ClanAnalysisToolDatasetOption extends StatefulWidget {
  final DatasetAnalyzable dataset;

  const ClanAnalysisToolDatasetOption({Key? key, required this.dataset}) : super(key: key);

  @override
  State<ClanAnalysisToolDatasetOption> createState() => _ClanAnalysisToolDatasetOptionState();
}

class _ClanAnalysisToolDatasetOptionState extends State<ClanAnalysisToolDatasetOption> {
  bool isHovered = false;
  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double boxHeight = screenHeight * 0.2;

    return Consumer<ClanAnalysisToolProvider>(
      builder: (context, clanAnalysisToolProvider, child) {
        bool isSelected = clanAnalysisToolProvider.selectedDatasetName == widget.dataset.datasetName;
        Color? containerColor = isSelected ? Colors.blueGrey : null;
        Color textColor = isSelected ? Colors.white : Colors.black;
        Color iconColor = isSelected ? Colors.white : Colors.blueGrey;

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              clanAnalysisToolProvider.selectDataset(widget.dataset);
            },
            child: Card(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: containerColor,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: isHovered
                  ? [const BoxShadow(color: Colors.white, blurRadius: 10, spreadRadius: 3)]
                  : [],
                ),
                height: boxHeight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.dataset.title, style: TextStyle(color: textColor, fontSize: 20)),
                        const SizedBox(height: 16),
                        Icon(widget.dataset.icon, color: iconColor, size: 60),
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
