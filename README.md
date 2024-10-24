Building the App for Different Flavors
For iOS: Use the following commands to build for each flavor:

flutter build ios --flavor dev --target lib/main_dev.dart
flutter build ios --flavor test --target lib/main_test.dart
flutter build ios --flavor prod --target lib/main_prod.dart


For Android: Use the following commands to build for each flavor:

flutter build apk --flavor dev --target lib/main_dev.dart
flutter build apk --flavor test --target lib/main_test.dart
flutter build apk --flavor prod --target lib/main_prod.dart



 flutter pub run build_runner build
