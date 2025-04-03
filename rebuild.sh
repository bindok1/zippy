flutter clean
cd android && ./gradlew clean && cd ..
dart run build_runner build --delete-conflicting-outputs
flutter run