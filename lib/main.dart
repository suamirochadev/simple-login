import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login/features/login/data/datasources/dio_service.dart';
import 'package:simple_login/features/login/domain/repositories/authentication_repository.dart';
import 'package:simple_login/features/login/presentation/bloc/login_bloc.dart';
import 'package:simple_login/features/login/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = DioService();
    final authenticationRepository = AuthenticationRepository(dio: dio);

    return BlocProvider(
      create: (_) => LoginBloc(
        dio,
        authenticationRepository: authenticationRepository
      ),
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
