import 'package:resources/constant/string_constant.dart';

// ignore: constant_identifier_names
enum Flavor { DEV, STAGING, PRODUCTION, DEMO }

class FlavorValues {
  final String baseUrl;
  final String baseApiUrl;

  FlavorValues({
    required this.baseUrl,
    required this.baseApiUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      StringConstant.enumName(flavor.toString()),
      values,
    );

    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance?.flavor == Flavor.DEV;
}
