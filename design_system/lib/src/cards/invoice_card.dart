import 'package:flutter/material.dart';

class InvoiceCard extends StatefulWidget {
  const InvoiceCard({super.key, required this.invoice});

  final dynamic invoice;

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          widget.invoice?.plan.name,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'R\$ ${widget.invoice.amount.toStringAsFixed(2)}',
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
  }
}
