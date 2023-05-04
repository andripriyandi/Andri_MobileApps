import 'package:data/models/response/response.dart';
import 'package:data/other/failure_model.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:data/other/view_data_state.dart';
import 'package:flutter/foundation.dart';
import 'package:home/domain/usecase/home_usecase.dart';
import 'package:shared_pref/shared_pref/shared_pref.dart';
import 'package:dependencies/bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase useCase;
  final SharedPref sharedPref;

  HomeBloc({required this.useCase, required this.sharedPref})
      : super(HomeState.initial()) {
    on<GetProductEvent>(_mapGetProuctEventToState);
  }

  void _mapGetProuctEventToState(
      GetProductEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(statusProduct: ViewData.loading(message: 'loading')));
      final result = await useCase.getProductProcess(page: event.page);

      result.fold(
        (failure) => emit(
          state.copyWith(
            statusProduct: ViewData.error(
              failure: FailureModel(
                message: failure.message,
              ),
            ),
          ),
        ),
        (result) async {
          if (result.listProduct?.isEmpty ?? false) {
            emit(
              state.copyWith(
                statusProduct: ViewData.noData(message: 'No Data'),
              ),
            );
          } else {
            emit(state.copyWith(
              statusProduct: ViewData.loaded(data: result),
            ));
          }
        },
      );
    } catch (error) {
      debugPrint("Error get product : $error");
      emit(state.copyWith(
        statusProduct: ViewData.error(
          failure: FailureModel(
            message: '$error',
          ),
        ),
      ));
    }
  }
}
