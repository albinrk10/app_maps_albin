import 'dart:async';


import 'package:app_maps_albin/ui/utils/map_style.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier, Offset;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends ChangeNotifier{
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();
  final _marketsController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _marketsController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(-11.9915881, -77.0156102),
    zoom: 15,
  );

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) {
    final id= markers.length.toString();
    final markerId = MarkerId(id);
    final marker = Marker(
      markerId: markerId,
      position: position,
      draggable: true, //mover el marcador
      icon: BitmapDescriptor.defaultMarkerWithHue(100), //colores del puntero del google maps
      //rotation: -45, //rotacion
      //anchor: const Offset(0.5, 1),
      onTap: (){
        _marketsController.sink.add(id);
      },
       onDragEnd:(newPosition){
       print("new position $newPosition"); // mantengo presionado y suelto me lanza la nueva posicion con el debug controller
    }
    );
   
    _markers[markerId] = marker;
    notifyListeners();
  }
  @override
  void dispose() {
   _marketsController.close();
    super.dispose();
  }
}
