import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_sqlite/providers/scans_provider.dart';
import 'package:qrscanner_sqlite/widgets/widgets.dart';

class MapsScreens extends StatelessWidget {
  const MapsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScansProvider>(context);
    final scansList = scanProvider.scanlist;

    return HistoryList(
      scans: scansList,
      onDismissedFn: (id) => scanProvider.deleteScansById(id),
    );
  }
}
