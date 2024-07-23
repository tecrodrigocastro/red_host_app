import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:red_host_app/src/core/utils/loading_start.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final authBloc = GetIt.I.get<AuthBloc>();
    return LoadinStart(
      onInit: () {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            if (authBloc.state.authenticated) {
              Navigator.pushReplacementNamed(
                context,
                '/base',
                arguments: {
                  'index': 0,
                },
              );
            } else {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
        );
      },
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AppIcons.kingLogoHorizontal,
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
