import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
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
    );
  }
}
