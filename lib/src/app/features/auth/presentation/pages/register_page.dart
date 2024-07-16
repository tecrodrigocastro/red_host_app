import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:red_host_app/src/core/enums/status_enum.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final phoneEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: theme.primaryColor,
        elevation: 0,
        title: Text(
          'Registrar',
          style: theme.textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AppIcons.kingLogoHorizontal,
                    height: 50,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Crie sua conta e venha ser um Rei!',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppInputFiled(
                    controller: nameEC,
                    hintText: 'Nome',
                    validator: (p0) => p0.isEmpty ? 'Campo obrigatório' : null,
                  ),
                  const SizedBox(height: 20),
                  AppInputFiled(
                    controller: phoneEC,
                    hintText: 'Telefone',
                    validator: (p0) => p0.isEmpty ? 'Campo obrigatório' : null,
                  ),
                  const SizedBox(height: 20),
                  AppInputFiled(
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
                  AppInputFiled(
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
                            content: Text('Registro efetuado com sucesso'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context).pushReplacementNamed('/base');
                      }
                    },
                    builder: (context, state) {
                      if (state.status == StateStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        );
                      }
                      return PrimaryButton(
                        color: Colors.white,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authBloc.add(
                              RegisterEvent(
                                email: emailEC.text.trim(),
                                password: emailEC.text.trim(),
                                name: nameEC.text.trim(),
                                phone: phoneEC.text.trim(),
                              ),
                            );
                          }
                        },
                        title: 'Registrar',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
