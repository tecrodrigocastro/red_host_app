import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:red_host_app/src/app/features/auth/presentation/pages/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RED HOST',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      home: const LoginPage(),
    );
  }
}
