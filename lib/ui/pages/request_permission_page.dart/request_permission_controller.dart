
import 'dart:async';


import 'package:permission_handler/permission_handler.dart';

class RequestPermissionController{
  final Permission _localPermission;

  RequestPermissionController(this._localPermission);


  final _streamController = StreamController<PermissionStatus>.broadcast();

  Stream<PermissionStatus> get onStatusChanget => _streamController.stream;


 Future<PermissionStatus> check() async {
  final status =await _localPermission.status;
   return status;
  }

 Future<void> request() async{
   final status =await _localPermission.request();
   print("status $status");
      _notify(status);
  
  }
   void _notify(PermissionStatus status){
    if(_streamController.isClosed && _streamController.hasListener){
      _streamController.sink.add(status);
    }
   }
   void dispone(){
  _streamController.close();
   }

  void dispose() {}
  
  }

  void dispose() {

  }
