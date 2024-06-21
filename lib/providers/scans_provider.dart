import 'package:flutter/material.dart';
import 'package:qrscanner_sqlite/models/scan_model.dart';
import 'package:qrscanner_sqlite/providers/db_provider.dart';

class ScansProvider extends ChangeNotifier {
  List<ScanModel> scanlist = [];
  String typeSelected = 'geo';

  ScansProvider() {
    getScansByType(typeSelected);
  }

  newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    newScan.id = id;

    if (typeSelected == newScan.type) {
      scanlist.add(newScan);
      notifyListeners();
    }
  }

  getScans() async {
    final data = await DBProvider.db.getScans();
    scanlist = [...data];
    notifyListeners();
  }

  getScansByType(String type) async {
    typeSelected = type;
    final data = await DBProvider.db.getScansByType(type);
    scanlist = [...data];
    notifyListeners();
  }

  deleteScans() async {
    scanlist = [];
    await DBProvider.db.deleteAllScan();
    notifyListeners();
  }

  deleteScansById(int id) async {
    scanlist.removeWhere((scan) => scan.id == id);
    await DBProvider.db.deleteScan(id);
    getScansByType(typeSelected);
  }
}
