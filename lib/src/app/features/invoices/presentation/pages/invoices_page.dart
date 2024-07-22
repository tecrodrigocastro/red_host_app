import 'package:flutter/material.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Faturas',
          style: theme.textTheme.displayMedium!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
