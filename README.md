# clash_of_clans_clan_helper

A Clash of Clans tool to help with strategy and analysis of both your own clan and others

# Environment and Setup
Flutter 3.16.7 • channel stable • https://github.com/flutter/flutter.git
Dart 3.2.4 • DevTools 2.28.5

### Setup Clash of Clans Api Integration
- Register an account with clash of clans
- Create a Clash of Clans Api Key
- Create an AWS secret manager instance with a secret id of "ClashOfClansApiKey"
- Store your Clash of Clans Api Key under the key name "clash-of-clans-user-key"
- Provision an IAM profile to have access to your secrets manager
- "cp config/app_config_example.json app_config.json" and then replace with actual credentials from your IAM profile

### Setup for OpenAI Integration
- Register a developer account with OpenAI
- Create an OpenAI Key
- Store your OpenAI key under the key name "openai-api-key" in the secret manager instance: "ClashOfClansApiKey"

### CORS issues:
- follow steps from https://pub.dev/packages/flutter_cors and update PATH obj
- active fluttercors globally: "dart pub global activate flutter_cors"
- fluttercors --disable to locally disable CORS because we are hitting external API locally

# Running the application
- "flutter pub get"
- "flutter run"
