import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qrscanner_sqlite/models/scan_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    CameraPosition initialPosition = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
      tilt: 50,
    );

    Set<Marker> markers = <Marker>{};
    markers.add(
      Marker(
        markerId: const MarkerId('geo'),
        position: scan.getLatLng(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        actions: [
          IconButton(
            onPressed: () async => callToActionLocation(scan),
            icon: const Icon(Icons.location_on),
          )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: markers,
        mapType: mapType,
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () => callToActionFloatingBtn(),
      ),
    );
  }

  callToActionLocation(ScanModel scan) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: scan.getLatLng(), zoom: 17, tilt: 50),
      ),
    );
  }

  callToActionFloatingBtn() {
    if (mapType == MapType.normal) {
      mapType = MapType.hybrid;
    } else {
      mapType = MapType.normal;
    }
    setState(() {});
  }
}
