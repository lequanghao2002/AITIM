//ignore_for_file: deprecated_member_use

//import 'package:device_preview/device_preview.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lookup_app/core/constants/color_constants.dart';
import 'package:lookup_app/screens/splash_screen.dart';
import 'package:lookup_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AITIM',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       title: 'AITIM',
//       theme: ThemeData(
//         primaryColor: ColorPalette.primaryColor,
//         scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
//         backgroundColor: ColorPalette.backgroundScaffoldColor,
//       ),
//       routes: routes,
//       onGenerateRoute: generateRoutes,
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }
