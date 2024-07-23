import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:red_host_app/src/app/features/auth/presentation/pages/login_page.dart';
import 'package:red_host_app/src/app/features/auth/presentation/pages/register_page.dart';
import 'package:red_host_app/src/app/features/base/presentation/pages/base_page.dart';
import 'package:red_host_app/src/app/features/home/presentation/pages/home_page.dart';
import 'package:red_host_app/src/app/features/invoices/presentation/pages/invoices_page.dart';
import 'package:red_host_app/src/app/features/plans/presentation/bloc/plans_bloc.dart';
import 'package:red_host_app/src/app/features/plans/presentation/pages/plan_details_page.dart';
import 'package:red_host_app/src/app/features/plans/presentation/pages/plans_page.dart';
import 'package:red_host_app/src/app/features/splash/presentation/pages/splash_page.dart';
import 'package:red_host_app/src/core/DI/dependency_injector.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<AuthBloc>()),
        BlocProvider(create: (context) => injector<PlansBloc>()),
      ],
      child: MaterialApp(
        title: 'RED HOST',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.ligthTheme,
        initialRoute: '/splash',
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/splash': (context) => const SplashPage(),
          '/base': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as Map;
            return BasePage(index: args['index']);
          },
          '/plans': (context) => const PlansPage(),
          '/plans/details': (context) {
            final args = ModalRoute.of(context)!.settings.arguments as Map;
            return PlanDetailsPage(plan: args['plan']);
          },
          '/invoices': (context) => const InvoicesPage(),
        },
      ),
    );
  }
}
