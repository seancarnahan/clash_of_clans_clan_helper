import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/constants/app_contants.dart';
import 'package:clash_of_clans_clan_helper/domain/entities/clan.dart';
import 'package:clash_of_clans_clan_helper/presentation/providers/clan_analysis_tool_provider.dart';

import 'clan_analysis_tool_dataset_option.dart';
import 'clan_analysis_tool_response.dart';

class ClanAnalysisTool extends StatelessWidget {
  final Clan clan;

  const ClanAnalysisTool({Key? key, required this.clan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < AppConstants.mobileOrTabletBreakpoint;
    double datasetContainerDividerSize = isMobile ? 12 : 24;

    return ChangeNotifierProvider<ClanAnalysisToolProvider>(
      create: (_) => ClanAnalysisToolProvider(),
      child: Column(
        children: [
          Builder(
            builder: (BuildContext context) {
              List<ClanAnalysisToolDataset> datasets = ClanAnalysisToolDataset.values.toList();
              List<Widget> datasetOptions = [];

              for (ClanAnalysisToolDataset dataset in datasets) {
                datasetOptions.add(
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: datasetContainerDividerSize),
                      child: ClanAnalysisToolDatasetOption(dataset: dataset)
                    )
                  )
                );
              }

              return Row(children: datasetOptions);
            }
          ),
          const ClanAnalysisToolResponse(),
        ],
      )
    );
  }
}
