import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_sqlite/providers/scans_provider.dart';
import 'package:qrscanner_sqlite/providers/ui_provider.dart';
import 'package:qrscanner_sqlite/screens/screens.dart';
import 'package:qrscanner_sqlite/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScansProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Scanner"),
        actions: [
          IconButton(
            onPressed: () async {
              await scanProvider.deleteScans();
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: const HomeScreenBody(),
      bottomNavigationBar: const CustomNavigatior(),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final scanProvider = Provider.of<ScansProvider>(context);

    switch (uiProvider.selectedMenuOption) {
      case 0:
        scanProvider.getScansByType('geo');
        return const MapsScreens();
      case 1:
        scanProvider.getScansByType('http');
        return const AddressScreen();
      default:
        scanProvider.getScansByType('geo');
        return const MapsScreens();
    }
  }
}
