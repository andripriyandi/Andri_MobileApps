import 'package:dependencies/get_it/get_it.dart';
import 'package:shared_pref/shared_pref/shared_pref.dart';
import 'package:shared_pref/shared_pref/shared_pref_impl.dart';

class SharedPrefDependency {
  SharedPrefDependency() {
    _registerSharedPref();
  }

  void _registerSharedPref() => locator.registerLazySingleton<SharedPref>(
      () => SharedPrefImpl(preferences: locator()));
}
