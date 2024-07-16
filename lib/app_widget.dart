import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:red_host_app/src/app/features/auth/presentation/pages/login_page.dart';
import 'package:red_host_app/src/app/features/base/presentation/pages/base_page.dart';
import 'package:red_host_app/src/app/features/home/presentation/pages/home_page.dart';
import 'package:red_host_app/src/app/features/splash/presentation/pages/splash_page.dart';
import 'package:red_host_app/src/core/DI/dependency_injector.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
          title: 'RED HOST',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.ligthTheme,
          initialRoute: '/splash',
          routes: {
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/splash': (context) => const SplashPage(),
            '/base': (context) => const BasePage(),
          }),
    );
  }
}
