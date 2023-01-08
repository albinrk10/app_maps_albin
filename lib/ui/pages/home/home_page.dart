import 'package:app_maps_albin/ui/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_){
        final controller= HomeController();
        controller.onMarkerTap.listen((String id) {
          print("got to $id");
        });
        return controller;
      },
      child: Scaffold(
      appBar: AppBar(),
      body: Consumer<HomeController>(
        builder:(_,controller, __) => GoogleMap(
        markers: controller.markers,
        onMapCreated: controller.onMapCreated,
        initialCameraPosition: controller.initialCameraPosition,
        myLocationButtonEnabled: false,
        compassEnabled: false,
        onTap: controller.onTap,
        //scrollGesturesEnabled: false,
       // zoomControlsEnabled: true,
       //mapType: MapType.terrain,
       //mapType: MapType.satellite,
      //  onTap: (position){
      //   print(position);
      //  },
      //  onLongPress: (position){
      //   print(position);
      //  }

      
      ), 
      ),
    ),
      );
  }
}
