import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login/features/login/domain/repositories/authentication_repository.dart';
import 'package:simple_login/features/login/presentation/bloc/login_bloc.dart';
import 'package:simple_login/features/login/presentation/pages/login_form.dart';

import '../../data/datasources/dio_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final dio = DioService();
    final authenticationRepository = AuthenticationRepository(dio: dio);

    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider(
            create: (context) => LoginBloc(
              dio,
                authenticationRepository: authenticationRepository,
            ),
            child: const LoginForm(),
          ),
        ));
  }
}
