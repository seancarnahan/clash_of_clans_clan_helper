import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

import 'package:clash_of_clans_clan_helper/domain/repositories/open_ai_repository.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/services/environment_service.dart';

class OpenAIApi implements OpenAIRepository {

  @override
  Future<String> analyzeDataset(String data, String prompt) async {
    final llm = OpenAI(apiKey: EnvironmentService().openAIApiKey);
    final llmPrompt = PromptValue.string('$prompt: $data');
    const options = OpenAIOptions(
      temperature: 0.7,
      maxTokens: 1500
    );
    final result = await llm.invoke(
      llmPrompt,
      options: options,
    );

    return result.firstOutputAsString.trim();
  }
}
