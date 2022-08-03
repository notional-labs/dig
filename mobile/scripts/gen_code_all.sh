cd dig_core
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
cd ..
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs