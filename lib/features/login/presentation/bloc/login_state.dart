part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}

class LoginSucess extends LoginState {
  final UserEntitie user;

  LoginSucess({required this.user});
}

class LoginFail extends LoginState {
  final String errorMessage;

  LoginFail({
    required this.errorMessage
  });
}
