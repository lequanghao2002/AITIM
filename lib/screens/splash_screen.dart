import 'package:flutter/cupertino.dart';
import 'package:lookup_app/core/helpers/image_helper.dart';
import 'package:lookup_app/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    redirectMainScreen();
  }

  void redirectMainScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed(MainScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageHelper.loadFromAsset(
        'assets/images/splash_background.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
