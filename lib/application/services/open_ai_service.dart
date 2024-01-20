import 'package:clash_of_clans_clan_helper/domain/repositories/open_ai_repository.dart';

class OpenAIService {
  final OpenAIRepository openAIRepository;

  OpenAIService(this.openAIRepository);

  Future<String> analyzeDataset(String data, String prompt) async {
    return await openAIRepository.analyzeDataset(data, prompt);
  }
}
