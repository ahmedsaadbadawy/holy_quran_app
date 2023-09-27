import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/views/doa_view.dart';
import 'package:quran_app/views/myhome_view.dart';
import 'package:quran_app/views/praise_view.dart';
import 'package:quran_app/views/prayer_view.dart';
import 'package:quran_app/views/tips_view.dart';

import '../constants.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;
  final screens = const [
    MyHomeView(),
    TipsView(),
    PrayerView(),
    DoaView(),
    PraiseView(),
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
        elevation: 0,
        backgroundColor: gray,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              color: Colors.grey,
              size: 32,
            ),
            activeIcon: Icon(Icons.auto_stories, size: 32),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lightbulb_outline,
              color: Colors.grey,
              size: 32,
            ),
            activeIcon: Icon(Icons.lightbulb, size: 32),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.personPraying,
              color: Colors.white54,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.personPraying,
              color: Color(0xFF6918b4),
            ),
            label: 'Prayer',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.handsPraying,
              color: Colors.white54,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.handsPraying,
              color: Color(0xFF6918b4),
            ),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.touch_app_outlined,
              color: Colors.grey,
              size: 32,
            ),
            activeIcon: Icon(Icons.touch_app, size: 32),
            label: 'Praise',
          ),
        ],
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem bottomBarItem(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(icon, color: primary),
      label: label,
    );
  }
}
