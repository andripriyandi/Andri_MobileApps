import 'package:data/models/response/response.dart';
import 'package:data/other/failure.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository homeRepository;

  HomeUseCase({
    required this.homeRepository,
  });

  Future<Either<Failure, ProductResponse>> getProductProcess(
      {required int page}) {
    return homeRepository.getProductProcess(page: page);
  }
}
