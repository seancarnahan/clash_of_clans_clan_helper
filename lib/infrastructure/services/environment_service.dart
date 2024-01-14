import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:aws_client/secrets_manager_2017_10_17.dart';

// Singleton Service
class EnvironmentService {
  static final EnvironmentService _environmentService = EnvironmentService._internal();

  Map<String, dynamic> _config = {};
  String get awsAccessKeyId => _config['AWS_ACCESS_KEY_ID'] ?? '';
  String get awsSecretAccessKey => _config['AWS_SECRET_ACCESS_KEY'] ?? '';
  String get awsRegion => _config['AWS_REGION'] ?? 'us-west-2';
  String get clashOfClansApiKey => _config['CLASH_OF_CLANS_API_KEY'] ?? '';



  factory EnvironmentService() {
    return _environmentService;
  }

  EnvironmentService._internal();

  loadEnv() async {
    // Load configuration from a local file, can't use dotenv for web
    String jsonString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(jsonString);

    // Load Clash of Clans API Key
    _config['CLASH_OF_CLANS_API_KEY'] = await _getClashOfClansApiKey();
  }

  AwsClientCredentials _getAwsClientCredentials() {
    return AwsClientCredentials(
      accessKey: awsAccessKeyId,
      secretKey: awsSecretAccessKey,
    );
  }

  Future<String?> _getClashOfClansApiKey() async {
    final secretsManager = SecretsManager(
      region: awsRegion,
      credentials: _getAwsClientCredentials()
    );
    
    try {
      final response = await secretsManager.getSecretValue(secretId: 'ClashOfClansApiKey');
      final secretString = response.secretString ?? '';

      if (secretString == '') {
        print('ERROR: Could not find clash of clans secret key');
        return null;
      }
      
      final secretJson = json.decode(secretString);
      final apiKey = secretJson['clash-of-clans-user-key'];

      return apiKey;
    } catch (e) {
      print('Error retrieving secret: $e');
      return null;
    } finally {
      secretsManager.close();
    }
  }

}
