import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clash_of_clans_clan_helper/presentation/providers/clan_analysis_tool_provider.dart';
import 'package:clash_of_clans_clan_helper/presentation/widgets/animated_typing_text.dart';

class ClanAnalysisToolResponse extends StatelessWidget {
  const ClanAnalysisToolResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClanAnalysisToolProvider>(
      builder: (context, clanAnalysisToolProvider, child) {
        return Expanded(
          child: Card(
            child: Container(
              width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: AnimatedTypingText(
                  text: clanAnalysisToolProvider.llmResponse,
                  placeHolderText: 'Select a dataset for OpenAI to analyze...',
                ),
              ),
          )
        );
      }
    );
  }
}
