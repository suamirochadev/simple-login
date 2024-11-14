part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.message = '',
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final bool isValid;
  final String message;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    bool? isValid,
    String? message,
  }) {
    return LoginState(
      message: message ?? this.message,
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, username, password, message];
}

final class LoginInitial extends LoginState {}

final class LoginSucess extends LoginState {
  const LoginSucess(String successMessage) : super(message: successMessage);
}

final class LoginFail extends LoginState {
  const LoginFail(String errorMessage) : super(message: errorMessage);
}

final class LoginInProgress extends LoginState {}
