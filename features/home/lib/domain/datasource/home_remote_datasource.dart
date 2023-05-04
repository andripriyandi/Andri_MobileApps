import 'package:data/models/response/home/product_response.dart';
import 'package:data/other/handle_failure.dart';
import 'package:data/other/response_object.dart';
import 'package:data/other/tupple.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:resources/constant/api_constant.dart';
import 'package:services/internal_service/get_data_api.dart';
import 'package:shared_pref/shared_pref/shared_pref.dart';
import 'package:services/config/config_environtment.dart';

class HomeRemoteDataSource extends ConfigEnvironment with GetDataApi {
  final Dio dio;
  final SharedPref sharedPref;
  HomeRemoteDataSource({required this.dio, required this.sharedPref});

  Future<ProductResponse> getProductProcess({required int page}) async {
    Tupple<HandleFailure, ResponseObject> data = await getdataAPIHeadersString(
      baseUrl: baseUrl,
      headers: {
        'accept': 'application/json',
      },
      endPoint: "${ApiConstant.testAlan}?_page=$page",
      nullSafety: '',
      serializer: ProductResponse.serializer,
    );

    ProductResponse dataResult = data.onSuccess as ProductResponse;

    return dataResult;
  }
}
