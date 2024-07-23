import 'package:flutter/material.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({super.key});

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  final _filtros = ['Pendentes', 'Pagos', 'Cancelados'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Faturas',
                style: theme.textTheme.displayLarge!.copyWith(
                  color: theme.primaryColor,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filtros.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Text(
                          _filtros[index],
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: theme.primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.primaryColor,
                            theme.primaryColor.withOpacity(0.5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          'Plano de Hospedagem',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          'R\$ 100,00',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Acessar',
                            style: theme.textTheme.bodyMedium,
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
