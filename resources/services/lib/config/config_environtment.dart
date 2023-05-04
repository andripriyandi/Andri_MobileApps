import 'dart:io';

import 'package:resources/constant/api_constant.dart';

class ConfigEnvironment {
  final String baseUrl = ApiConstant.baseUrlDev;

  final headers = {
    HttpHeaders.contentTypeHeader: "application/json",
  };
}
