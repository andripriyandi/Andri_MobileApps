part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetProductEvent extends HomeEvent {
  final int page;

  GetProductEvent({this.page = 1});

  List<Object> get props => [page];
}
