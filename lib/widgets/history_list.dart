import 'package:flutter/material.dart';
import 'package:qrscanner_sqlite/models/scan_model.dart';
import 'package:qrscanner_sqlite/utils/utils.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
    required this.scans,
    required this.onDismissedFn,
  });

  final List<ScanModel> scans;

  final Function(int) onDismissedFn;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int index) {
        return Dismissible(
          key: Key(scans[index].id.toString()),
          background: Container(color: Colors.red),
          child: itemList(scans[index], context),
          onDismissed: (value) => onDismissedFn(scans[index].id!),
        );
      },
    );
  }

  ListTile itemList(ScanModel item, BuildContext context) {
    return ListTile(
      leading: Icon(
        item.type == 'http' ? Icons.home : Icons.map_outlined,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(item.id.toString()),
      subtitle: Text(item.value),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => callToActionTap(context, item),
    );
  }

  callToActionTap(context, item) {
    if (item.value.contains('http')) {
      gotoUrl(item.value);
    } else {
      Navigator.pushNamed(
        context,
        'map',
        arguments: item,
      );
    }
  }
}
