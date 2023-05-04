import 'package:data/models/response/response.dart';
import 'package:data/other/database_exception.dart';
import 'package:data/other/failure.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:home/domain/datasource/home_remote_datasource.dart';
import 'package:home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponse>> getProductProcess(
      {required int page}) async {
    try {
      final result = await homeRemoteDataSource.getProductProcess(page: page);

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    }
  }
}
