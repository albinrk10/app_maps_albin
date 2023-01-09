
import 'package:app_maps_albin/ui/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplatshPage extends StatefulWidget {
  const SplatshPage({super.key});

  @override
  State<SplatshPage> createState() => _SplatshPageState();
}

class _SplatshPageState extends State<SplatshPage> {
  final _controller = SplashController(Permission.locationWhenInUse);

@override
void initState() {
  super.initState();
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    _controller.checkPermission();
   },
   );
  _controller.addListener(()
  {
    if(_controller.routeName != null ){
      Navigator.pushReplacementNamed(context, _controller.routeName!);
    }
  });
  
}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
      child:  CircularProgressIndicator(),
      ),
    );
  }
}