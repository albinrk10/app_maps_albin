import 'dart:async';

import 'package:app_maps_albin/ui/pages/request_permission_page.dart/request_permission_controller.dart';
import 'package:app_maps_albin/ui/routes/roustes.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RequetPermissionPage extends StatefulWidget {
  const RequetPermissionPage({super.key});

  @override
  State<RequetPermissionPage> createState() => _RequetPermissionPageState();
}

class _RequetPermissionPageState extends State<RequetPermissionPage> with WidgetsBindingObserver{
  final _controller =RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription= _controller.onStatusChanget.listen(
      (status) {
        switch(status){
          case PermissionStatus.granted:
          _goToHOME();
            break;
        case PermissionStatus.permanentlyDenied:
        openAppSettings();
        break;
    
      }
     },
     );
  }
    @override
    void didChangeAppLifecycleState(AppLifecycleState state)async{
      if (state == AppLifecycleState.resumed){
        final status = await _controller.check();
        if (status == PermissionStatus.granted){
          _goToHOME();
        }
      }
    }
    
   

@override
void dispose() {
  WidgetsBinding.instance!.removeObserver(this);
  _subscription.cancel();
  _controller.dispose();
  super.dispose();
}

void _goToHOME(){
   Navigator.pushReplacementNamed(context, Routes.HOME);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child:ElevatedButton (
            child: const Text("Allow"), 
            onPressed:(){
             _controller.request();   
          },
          ),
        ),
      ),
    );
  }
}