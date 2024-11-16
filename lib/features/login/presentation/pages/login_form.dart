import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:simple_login/features/login/presentation/bloc/login_bloc.dart';
import 'package:simple_login/features/login/presentation/pages/success_page.dart';
import 'package:simple_login/features/login/presentation/widgets/password_input.dart';
import 'package:simple_login/features/login/presentation/widgets/username_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SuccessPage(message: state.message)));
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            const PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSucess = context
        .select((LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess);

    if (isInProgressOrSucess) return const CircularProgressIndicator();

    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return ElevatedButton(
        onPressed: isValid
            ? () => context.read<LoginBloc>().add(const LoginSubmitted())
            : null,
        child: const Text('Login'));
  }
}
