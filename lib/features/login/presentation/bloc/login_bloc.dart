import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:simple_login/features/login/data/datasources/dio_service.dart';
import 'package:simple_login/features/login/domain/entities/user_entitie.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final DioService dio;

  LoginBloc({required this.dio}) : super(LoginInitial()) {
    on<LoginFecthEvent>(onLoginFecthEvent);
  }
}

Future<void> onLoginFecthEvent(
    LoginFecthEvent event, Emitter<LoginState> emit) async {
  emit(LoginLoading());

  try {
    final dio = DioService();
    final response = await dio.validatePassword(event.password);
    if (response.password != event.password) {
      final user = UserEntitie(id: response.id, response.password);
      emit(LoginSucess(user: user));
    } else {
      emit(LoginFail(errorMessage: 'Password invalid'));
    }
  } catch (e) {
    emit(LoginFail(errorMessage: 'Error: $e'));
  }
}
