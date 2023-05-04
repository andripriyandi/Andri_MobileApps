import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:network/network/api_helper.dart';
import 'package:network/network/api_helper_impl.dart';
import 'package:services/config/config_environtment.dart';
import 'package:services/config/dio_cilent.dart';

class NetworkDependency extends ConfigEnvironment {
  NetworkDependency() {
    _registerNetworkLibrary();
    _registerApiHelper();
    _dioClient();
  }
  void _registerNetworkLibrary() => locator.registerLazySingleton<Dio>(
        () => Dio(),
      );

  void _registerApiHelper() => locator.registerLazySingleton<ApiHelper>(
        () => ApiHelperImpl(
          dio: locator(),
        ),
      );

  void _dioClient() =>
      locator.registerLazySingleton(() => DioClient(apiBaseUrl: baseUrl));
}
