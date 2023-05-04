import 'package:home/domain/di/home_depedency.dart';
import 'package:network/di/dependency.dart';
import 'package:shared_pref/di/dependency.dart';

class Dependency {
  void initDependency() {
    _registerDomainHome();
    _registerSharedLibrary();
  }

  // Domain
  void _registerDomainHome() => HomeDependency();

  void _registerSharedLibrary() {
    NetworkDependency();
    SharedPrefDependency();
  }
}
