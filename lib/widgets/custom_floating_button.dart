import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner_sqlite/models/scan_model.dart';
import 'package:qrscanner_sqlite/providers/scans_provider.dart';
import 'package:qrscanner_sqlite/providers/ui_provider.dart';
import 'package:qrscanner_sqlite/utils/utils.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScansProvider>(context, listen: false);
    final uiProvider = Provider.of<UiProvider>(context, listen: false);

    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async => callToActionFloatinButton(
        scanProvider,
        uiProvider,
        context,
      ),
    );
  }

  callToActionFloatinButton(
    ScansProvider scanProvider,
    UiProvider uiProvider,
    BuildContext context,
  ) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#3D8BEF',
      'Salir',
      false,
      ScanMode.QR,
    );

    await scanProvider.newScan(barcodeScanRes);

    if (!barcodeScanRes.contains('-1')) {
      if (barcodeScanRes.contains('http')) {
        gotoUrl(barcodeScanRes);
        uiProvider.selectedMenuOption = 1;
      } else {
        final newScan = ScanModel(value: barcodeScanRes);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, 'map', arguments: newScan);
        uiProvider.selectedMenuOption = 0;
      }
    }
  }
}
