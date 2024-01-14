# clash_of_clans_clan_helper

A Clash of Clans tool to help with strategy and analysis of both your own clan and others

## Running the application
"cp config/app_config_example.json app_config.json" and then replace with actual credentials

## Hexagonical Architecture
flutter_project/
├── lib/
│   ├── domain/              # Core business logic
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── use_cases/
│   ├── infrastructure/      # Adapters for external concerns (e.g., API, database)
│   │   ├── api/
│   │   ├── db/
│   │   └── ...
│   ├── presentation/        # UI layer (screens, widgets)
│   │   ├── screens/
│   │   ├── widgets/
│   │   └── ...
│   ├── application/         # Application layer, connecting UI and domain
│   │   ├── ports/           # Ports interfaces
│   │   └── services/        # Services implementing the ports
│   └── main.dart
├── ...
