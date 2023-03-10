import 'package:flutter/material.dart'; 
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget { 

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late MapboxMapController mapController;
  final center = LatLng(37.82006418211845, -122.47861988235866);
  String selectedStyle = 'mapbox://styles/bryan-pc/clcqh203r000b16pdsrarxzot';
  final darkStyle = 'mapbox://styles/bryan-pc/clcqgz9fe001i14ohujgapkwo';
  final lightStyle = 'mapbox://styles/bryan-pc/clcqh203r000b16pdsrarxzot';


  void _onMapCreated(MapboxMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createMap(),
      floatingActionButton: floatingButtons(),
    );
  }

  Column floatingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[

        
        //simbolos
        FloatingActionButton(
          child: Icon(Icons.emoji_symbols),
          onPressed: (){
            
            
            mapController.addSymbol(SymbolOptions( 
              geometry: center, 
              iconSize: 3,
              textField: 'Mountain created here',
              iconImage: 'attraction-15',
              textOffset: Offset(0,1)
              //textColor: '#cccccc'
              ));
          }
          ),

        SizedBox(height: 5,),


        //ZOOM IN
        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: (){
          
            // mapController.animateCamera(CameraUpdate.tiltTo(40));
            mapController.animateCamera(CameraUpdate.zoomIn());
          }
          ),

        SizedBox(height: 5,),

        //ZOOM out
        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: (){
          
            // mapController.animateCamera(CameraUpdate.tiltTo(40));
            mapController.animateCamera(CameraUpdate.zoomOut());
          }
          ),

        SizedBox(height: 5,),



        //cambiar estilo
        FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: (){
            if (selectedStyle == darkStyle){
              selectedStyle = lightStyle;
            }else{
              selectedStyle = darkStyle;
            }

            setState(() {});
          }
          )
      ],
    );
  }

  MapboxMap createMap() {
    return MapboxMap(
      styleString: selectedStyle,
      accessToken: 'sk.eyJ1IjoiYnJ5YW4tcGMiLCJhIjoiY2xjcWZ5OTF5MDVibzNwbjJrMmlrazB5biJ9.HhKUC-9l69_6c-VZy1NRSg',
      onMapCreated: _onMapCreated,
      initialCameraPosition: 
      CameraPosition(
        target: center,
        zoom: 14),
    );
  }
}