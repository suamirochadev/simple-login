import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login/features/login/presentation/bloc/login_bloc.dart';

class UsernameInput extends StatelessWidget {
  const UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.username.displayError,
    );

    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      onChanged: (username) {
        context.read<LoginBloc>().add(LoginUsernameChanged(username));
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'username',
          errorText: displayError != null ? 'invalid username' : null),
    );
  }
}
