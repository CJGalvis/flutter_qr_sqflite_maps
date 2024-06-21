import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_sqlite/providers/ui_provider.dart';

class CustomNavigatior extends StatelessWidget {
  const CustomNavigatior({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      currentIndex: uiProvider.selectedMenuOption,
      onTap: (int value) => uiProvider.selectedMenuOption = value,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Maps',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones',
        ),
      ],
    );
  }
}
