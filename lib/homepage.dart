


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Logica extends StatelessWidget {
  const Logica({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition = CameraPosition(
    target: LatLng(0, 0),
    // zoom: 3,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}