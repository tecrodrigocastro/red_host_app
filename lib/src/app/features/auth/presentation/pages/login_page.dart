import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:red_host_app/src/core/enums/status_enum.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = GetIt.I.get<AuthBloc>();
    final theme = Theme.of(context);
    //log('authBloc: ${authBloc.state.status}');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image(
                  image: AppIcons.kingLogo,
                  height: size.height * 0.2,
                ),
                const SizedBox(height: 40),
                AppInput(
                  controller: emailEC,
                  hintText: 'Email',
                  validator: (p0) {
                    if (p0.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    if (!p0.contains('@')) {
                      return 'Email inválido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                AppInput(
                  controller: passwordEC,
                  hintText: 'Senha',
                  obscureText: true,
                  validator: (p0) => p0.isEmpty ? 'Campo obrigatório' : null,
                ),
                const SizedBox(height: 40),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == StateStatus.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error!),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }

                    if (state.status == StateStatus.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login efetuado com sucesso'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushReplacementNamed(context, '/base');
                    }
                  },
                  builder: (context, state) {
                    if (state.status == StateStatus.loading) {
                      return CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(theme.primaryColor),
                      );
                    }
                    return PrimaryButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          authBloc.add(
                            LoginEvent(
                              email: emailEC.text,
                              password: passwordEC.text,
                            ),
                          );
                        }
                      },
                      title: 'Entrar',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
