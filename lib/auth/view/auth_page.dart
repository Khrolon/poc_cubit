import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit/auth/cubit/auth_cubit.dart';
import 'package:poc_cubit/auth/cubit/auth_state.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Login'),
      ),
      body: BlocListener<AuthCubit, AuthState>(listener: (context, state) {
        if (state.status == AuthStateStatus.errorAuth ) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erro ao logar'),
            ),
          );
        }
        if (state.status == AuthStateStatus.workAuth) {
          Navigator.pushNamed(context, '/home');
        }
      }, child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state.status == AuthStateStatus.loadingAuth) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: context.read<AuthCubit>().emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Digite seu Email',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: context.read<AuthCubit>().passwordController,
                  obscureText: true, // Para ocultar a senha
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    labelText: 'Digite sua Senha',
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().validateLogin();
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        );
      })),
    );
  }
}
