// ignore:
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/views/doa_view.dart';
import 'package:quran_app/views/myhome_view.dart';
import 'package:quran_app/views/praise_view.dart';
import 'package:quran_app/views/tips_view.dart';

import '../constants.dart';
import '../views/azkar_view.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;
  final screens = const [
    MyHomeView(),
    DoaView(),
    AzkarView(),
    PraiseView(),
    TipsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: primary,
        unselectedItemColor: tm == ThemeMode.dark ? Colors.grey : primary,
        elevation: 0,
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: 32,
            ),
            activeIcon: Icon(Icons.auto_stories, size: 32),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.handsPraying,
            ),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.personPraying,
            ),
            label: 'Azkar',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.touch_app,
              size: 32,
            ),
            label: 'Praise',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lightbulb,
              size: 32,
            ),
            label: 'Tips',
          ),
        ],
        currentIndex: _index,
        onTap: (value) {
          _index = value;
          setState(() {});
        },
      ),
    );
  }
}
