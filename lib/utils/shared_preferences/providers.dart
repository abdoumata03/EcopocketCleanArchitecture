import 'package:ecopocket_clean_architecture/utils/shared_preferences/app_shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@riverpod
appSharedPreference(AppSharedPreferenceRef ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return AppSharedPreference(sharedPrefs);
}
