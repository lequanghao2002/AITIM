import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lookup_app/core/constants/color_constants.dart';
import 'package:lookup_app/core/constants/dimension_contants.dart';
import 'package:lookup_app/screens/camera_screen.dart';
import 'package:lookup_app/screens/home_screen.dart';
import 'package:lookup_app/screens/love_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = '/main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currenIndex,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          HomeScreen(),
          LoveScreen(),
          CameraScreen(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currenIndex,
        onTap: (index) {
          setState(() {
            _currenIndex = index;
          });
        },
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        margin: EdgeInsets.symmetric(
          horizontal: kMediumPadding,
          vertical: kDefaultPadding,
        ),
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
              size: kDefaultIconSize,
            ),
            title: Text('Trang chủ'),
            selectedColor: ColorPalette.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.solidHeart,
              size: kDefaultIconSize,
            ),
            title: Text('Yêu thích'),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: kDefaultIconSize,
            ),
            title: Text('Tìm kiếm'),
          ),
        ],
      ),
    );
  }
}
