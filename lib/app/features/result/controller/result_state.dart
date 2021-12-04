part of 'result_cubit.dart';

@immutable
abstract class ResultState {}

class ResultInitial extends ResultState {}

class ResultNotFound extends ResultState {
  ResultNotFound({required this.nameSelected});
  final String nameSelected;
}

class ResultSuccess extends ResultState {
  ResultSuccess({
    required this.nameSelected,
    required this.nameWinner,
    required this.emailWinner,
  });
  final String nameSelected;
  final String nameWinner;
  final String emailWinner;
}
