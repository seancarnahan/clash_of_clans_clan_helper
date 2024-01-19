import 'package:flutter/material.dart';

import 'package:clash_of_clans_clan_helper/presentation/providers/clan_analysis_tool_provider.dart';

class ClanAnalysisToolDatasetOption extends StatelessWidget {
  final ClanAnalysisToolDataset dataset;
  
  const ClanAnalysisToolDatasetOption({Key? key, required this.dataset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double boxHeight = screenHeight * 0.2;

    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
        ),
        height: boxHeight,
        child: const Text('foo'),
      ),
    );
  }
}
