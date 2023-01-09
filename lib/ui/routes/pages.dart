
import 'package:app_maps_albin/ui/pages/home/home_page.dart';
import 'package:app_maps_albin/ui/pages/request_permission_page.dart/request_permission_page.dart';
import 'package:app_maps_albin/ui/pages/splash/splash_page.dart';
import 'package:app_maps_albin/ui/routes/roustes.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.SPALSH:(_)=>const SplatshPage(),
    Routes.PERMISSIONS:(_)=> const  RequetPermissionPage(),
    Routes.HOME:(_) =>const  HomePage(),
  };
}