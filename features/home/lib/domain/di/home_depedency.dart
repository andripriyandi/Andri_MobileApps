import 'package:dependencies/get_it/get_it.dart';
import 'package:home/domain/datasource/home_remote_datasource.dart';
import 'package:home/domain/repository/home_repository.dart';
import 'package:home/domain/repository/home_repository_impl.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:home/presentation/bloc/home_bloc.dart';
// import 'package:home/presentation/bloc/home_bloc.dart';

class HomeDependency {
  HomeDependency() {
    _regiterDataSource();
    _registerRepository();
    _registerUseCase();
    _homeBloc();
  }

  // Datasource
  void _regiterDataSource() => locator.registerLazySingleton(
      () => HomeRemoteDataSource(dio: locator(), sharedPref: locator()));

  // Repository
  void _registerRepository() => locator.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: locator()));

  // UseCase
  void _registerUseCase() =>
      locator.registerFactory(() => HomeUseCase(homeRepository: locator()));

  // Bloc
  void _homeBloc() => locator.registerFactory(
      () => HomeBloc(useCase: locator(), sharedPref: locator()));
}
