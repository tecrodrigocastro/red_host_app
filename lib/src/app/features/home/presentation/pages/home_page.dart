import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:red_host_app/src/app/features/home/presentation/widgets/analytics_widget.dart';
import 'package:red_host_app/src/app/features/home/presentation/widgets/card_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchEC = TextEditingController();

  List<IconData> servicesIcons = [
    Icons.network_check_rounded,
    Icons.email,
    Icons.vpn_key_sharp,
    Icons.account_balance,
    Icons.cloud,
  ];

  List<String> vpsStatus = [
    'Memoria RAM',
    'CPU',
    'Disco',
    'Rede',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = GetIt.I.get<AuthBloc>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        toolbarHeight: size.height * 0.2,
        title: RichText(
          text: TextSpan(
            text: 'Olá, \n',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: authBloc.state.user?.name ?? 'Guest',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconComponent(
            icon: Icons.notifications_none,
            onPressed: () {},
          ),
          IconComponent(
            icon: Icons.logout,
            onPressed: () {
              authBloc.add(const LogoutEvent());
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              //  minRadius: 25,
              radius: 25,
              foregroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/31713982?v=4',
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: AppInputFiled(
              controller: searchEC,
              hintText: 'Pesquise algo',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardHome(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Serviços',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: theme.primaryColor,
                        child: Icon(
                          servicesIcons[Random().nextInt(servicesIcons.length)],
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Analises de VPS',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: size.height * 0.31,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            height: 210,
                            width: 150,
                            child: AnalyticsWidget(
                              title: 'Servidor $index',
                              value:
                                  vpsStatus[Random().nextInt(vpsStatus.length)],
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
