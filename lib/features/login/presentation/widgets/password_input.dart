import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login/features/login/presentation/bloc/login_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.password.displayError,
    );

    return TextField(
      key: const Key('loginForm_passwordInput_textfield'),
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      obscureText: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'password',
        helperText: 'At least 8 characters includin one letter and number',
        errorText: displayError != null ? 'invalid password' : null,
      ),
    );
  }
}
