import 'package:flutter/material.dart';
import 'package:to_do_list/src/core/presentation/designsystem/widgets/custom_fab.dart';
import 'package:to_do_list/src/presentation/pages/widgets/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeContent()
      ),
      floatingActionButton: CustomFAB(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        iconData: Icons.add,
        onPressed: () {
          // Redirigir a pantalla para agregar TO DO
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}