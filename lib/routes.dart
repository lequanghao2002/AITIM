import 'package:flutter/material.dart';
import 'package:lookup_app/models/medicine_model.dart';
import 'package:lookup_app/screens/camera_screen.dart';
import 'package:lookup_app/screens/detail_screen.dart';
import 'package:lookup_app/screens/home_screen.dart';
import 'package:lookup_app/screens/love_screen.dart';
import 'package:lookup_app/screens/main_screen.dart';
import 'package:lookup_app/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  //DetailScreen.routeName: (context) => const DetailScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoveScreen.routeName: (context) => const LoveScreen(),
  CameraScreen.routeName: (context) => const CameraScreen(),
};

// ignore: body_might_complete_normally_nullable
MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case DetailScreen.routeName:
      return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            final MedicineModel medicineModel =
                (settings.arguments as MedicineModel);
            return DetailScreen(
              medicineModel: medicineModel,
            );
          });
  }
}
