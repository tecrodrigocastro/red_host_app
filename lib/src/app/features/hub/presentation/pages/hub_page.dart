import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HubPage extends StatefulWidget {
  const HubPage({super.key});

  @override
  State<HubPage> createState() => _HubPageState();
}

class _HubPageState extends State<HubPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HUB',
                style: theme.textTheme.displayLarge!.copyWith(
                  color: theme.primaryColor,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: const [
                    HubCard(
                      title: 'Perfil',
                      icon: Icons.person_2_outlined,
                    ),
                    HubCard(
                      title: 'Serviços',
                      icon: Icons.settings,
                    ),
                    HubCard(
                      title: 'Faturas',
                      icon: Icons.receipt_long,
                    ),
                    HubCard(
                      title: 'Relatórios',
                      icon: Icons.analytics,
                    ),
                    HubCard(
                      title: 'Tickets',
                      icon: Icons.support_agent,
                    ),
                    HubCard(
                      title: 'Planos',
                      icon: Icons.account_balance,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
