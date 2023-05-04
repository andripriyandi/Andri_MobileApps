part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ViewData<ProductResponse> statusProduct;

  const HomeState({
    required this.statusProduct,
  });

  factory HomeState.initial() {
    return HomeState(
      statusProduct: ViewData.initial(),
    );
  }

  HomeState copyWith({
    ViewData<ProductResponse>? statusProduct,
  }) {
    return HomeState(
      statusProduct: statusProduct ?? this.statusProduct,
    );
  }

  @override
  List<Object?> get props => [statusProduct];
}
