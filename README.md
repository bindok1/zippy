# Zippy - Kids' Bedtime Stories App

A Flutter mobile application for children's bedtime stories with interactive features.

## Features

- Interactive story browsing with wheel scroll effect
- Story categories for easy navigation
- Skeleton loading for better UX
- Offline caching support
- Search functionality
- Push notification support

## Tech Stack

- Flutter 3.x
- Bloc Pattern for state management
- GetIt & Injectable for dependency injection
- Dio for API calls with caching
- Connectivity Plus for network handling
- Supabase for backend services

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation
1. Clone the repository
```bash
git clone https://github.com/bindok1/zippy.git
```
2. Install dependencies
```bash
flutter pub get
```
3. Run the app
```bash
flutter run
```bash
4. Project Structure
lib/
├── constant/       # App constants and configurations
├── core/          # Core functionality
│   ├── base/      # Base classes
│   ├── http/      # HTTP client setup
│   └── service/   # Core services
├── data/          # Data layer
│   ├── model/     # Data models
│   ├── repository/# Repository implementations
│   └── source/    # Data sources (local & remote)
├── di/            # Dependency injection setup
├── domain/        # Domain layer
│   ├── entity/    # Business entities
│   ├── repository/# Repository interfaces
│   └── usecase/   # Business logic
├── features/      # Feature modules
│   ├── home/      # Home feature
│   ├── main/      # Main app feature
│   └── vip/       # VIP feature
├── services/      # App services
├── theme/         # App theming
└── utils/         # Utilities and helpers

## Development Branches
- master - Main branch
- prod - Production releases
- dev - Active development

## Contributing
1. Create feature branch from development
2. Implement changes
3. Create PR to development branch