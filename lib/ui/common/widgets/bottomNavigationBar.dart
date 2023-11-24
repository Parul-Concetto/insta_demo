import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/ui/common/asset_images.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: context.theme.colorScheme.secondaryContainer,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(PNGPath.homeIcon), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(PNGPath.reelIcon), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(PNGPath.plusIcon), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(PNGPath.shoppingIcon), label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(PNGPath.profileIcon), label: ''),
        ]);
  }
}
