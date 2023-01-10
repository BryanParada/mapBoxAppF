import 'package:flutter/material.dart'; 
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget { 

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        accessToken: 'sk.eyJ1IjoiYnJ5YW4tcGMiLCJhIjoiY2xjcWZ5OTF5MDVibzNwbjJrMmlrazB5biJ9.HhKUC-9l69_6c-VZy1NRSg',
        onMapCreated: _onMapCreated,
        initialCameraPosition: 
        const CameraPosition(
          target: LatLng(37.82006418211845, -122.47861988235866),
          zoom: 14),
      )
    );
  }
}