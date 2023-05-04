import 'dart:io';
import 'package:data/other/tupple.dart';
import 'package:data/other/handle_failure.dart';
import 'package:data/other/response_object.dart';

abstract class ApiHelper {
  Future<Tupple<HandleFailure, ResponseObject>> getdataAPI({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> getdataAPIHeaders({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> getdataAPIHeadersString({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required String nullSafety,
    required ResponseObject Function(List<dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> postdataAPIHeadersBody({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> putdataAPIHeadersBody({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> postdataAPIHeadersBodyWithFile({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required File file,
    required Map<String, String> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> postdataAPIBody({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> postdataAPI({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>> postdataAPIBodyWithoutSSL({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>>
      postdataAPIHeadersBodyWithFileDio({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>>
      putdataAPIHeadersBodyWithFileDio({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>>
      deleteDataAPIHeadersBodyWithFileDio({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });

  Future<Tupple<HandleFailure, ResponseObject>>
      putdataAPIHeadersBodyWithUrlEncodeDio({
    required String baseUrl,
    required String endPoint,
    required Map<String, String> headers,
    required Map<String, dynamic> bodyObject,
    required Map<String, dynamic> nullSafety,
    required ResponseObject Function(Map<String, dynamic>) serializer,
  });
}
