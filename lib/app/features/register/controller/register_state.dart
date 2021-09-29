part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterButtonAllow extends RegisterState {}

class RegisterButtonDenied extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterNameHasSelected extends RegisterState {
  RegisterNameHasSelected({required this.name});

  final List<String> name;
}

class RegisterSuccess extends RegisterState {
  RegisterSuccess({
    required this.name,
  });
  final String name;
}
