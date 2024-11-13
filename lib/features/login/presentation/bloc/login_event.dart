part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginFecthEvent extends LoginEvent {
  final String id;
  final String password;

  LoginFecthEvent(this.password, {required this.id});
}
