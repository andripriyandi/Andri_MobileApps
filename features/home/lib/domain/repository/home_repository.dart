import 'package:data/models/response/response.dart';
import 'package:data/other/failure.dart';
import 'package:dependencies/dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, ProductResponse>> getProductProcess(
      {required int page});
}
