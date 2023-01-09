
import 'package:app_maps_albin/ui/pages/home/home_page.dart';
import 'package:app_maps_albin/ui/routes/pages.dart';
import 'package:app_maps_albin/ui/routes/roustes.dart';
import 'package:flutter/material.dart';

void main() {runApp( MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'consumo de api de google',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: Routes.SPALSH,
      routes:appRoutes() ,
    );
  }
}