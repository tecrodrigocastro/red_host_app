import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = GetIt.I.get<AuthBloc>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        toolbarHeight: 60,
        title: Text(
          'Sua conta',
          style: theme.textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              authBloc.add(const LogoutEvent());
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              minRadius: 25,
              foregroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/31713982?v=4',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Fatura atual'),
                        Text('BRL'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'R\$ 274,00',
                      style: theme.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Chip(
                          label: Text(
                            'Pagar fatura',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: theme.primaryColor,
                        ),
                        Chip(
                          label: Text(
                            'Ver faturas',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: theme.primaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
