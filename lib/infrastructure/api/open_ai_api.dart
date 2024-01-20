import 'package:dart_openai/dart_openai.dart';

import 'package:clash_of_clans_clan_helper/domain/repositories/open_ai_repository.dart';
import 'package:clash_of_clans_clan_helper/infrastructure/services/environment_service.dart';

class OpenAIApi implements OpenAIRepository {

  @override
  Future<String> analyzeDataset(String data, String prompt) async {
    String query = '$prompt: $data';

    OpenAI.apiKey = EnvironmentService().openAIApiKey;

    print('here');
    List<OpenAIModelModel> models = await OpenAI.instance.model.list();
    print('here 1');
    print(models);

    OpenAICompletionModel completion = await OpenAI.instance.completion.create(
      model: "text-davinci-003",
      prompt: query,
      maxTokens: 1000,
      temperature: 0.7,
      n: 1,
      echo: true,
      bestOf: 2,
    );

    // Extract and return the text response
    return completion.choices.first.text.trim();
  }
}
