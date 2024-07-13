import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                AppInput(controller: emailEC, hintText: 'Email'),
                const SizedBox(height: 20),
                AppInput(
                  controller: passwordEC,
                  hintText: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  onPressed: () {},
                  title: 'Entrar',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
