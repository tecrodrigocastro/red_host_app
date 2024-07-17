import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_host_app/src/app/features/plans/presentation/bloc/plans_bloc.dart';
import 'package:red_host_app/src/core/utils/loading_start.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  @override
  Widget build(BuildContext context) {
    final plansBloc = context.read<PlansBloc>();
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return LoadinStart(
      onInit: () {
        plansBloc.add(GetPlansEvent());
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Planos',
                  style: theme.textTheme.displayLarge!.copyWith(
                    color: theme.primaryColor,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Chip(
                        backgroundColor: theme.primaryColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        label: Text(
                          'Tipo de plano $index',
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<PlansBloc, PlansState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is PlansError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    if (state is PlansLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.plans.length,
                          itemBuilder: (context, index) {
                            final plan = state.plans[index];
                            return Card(
                              child: ListTile(
                                title: Text(
                                  'Plano ${plan.name}',
                                  style: theme.textTheme.bodyLarge,
                                ),
                                subtitle: Text(
                                  'Valor: R\$ ${plan.price}',
                                  style: theme.textTheme.bodySmall,
                                ),
                                trailing: IconComponent(
                                  icon: Icons.arrow_forward_ios,
                                  onPressed: () {},
                                  color: theme.primaryColor,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(theme.primaryColor),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
