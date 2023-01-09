

import 'package:app_maps_albin/ui/routes/roustes.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier ;
import 'package:permission_handler/permission_handler.dart';


class SplashController extends ChangeNotifier{
  final Permission _locationpermission;
  String? _routeName;
  String? get routeName =>_routeName;

  SplashController(this._locationpermission);


Future<void>  checkPermission() async{
  final isGranted = await _locationpermission.isGranted;
  _routeName = isGranted ? Routes.HOME: Routes.PERMISSIONS;
  notifyListeners();
}
}