import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      backgroundColor: gray,
      items: [
        bottomBarItem(icon: 'assets/svgs/quran-icon.svg', label: 'Quran'),
        bottomBarItem(icon: 'assets/svgs/lamp-icon.svg', label: 'Tips'),
        bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "Prayer"),
        bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Doa"),
        bottomBarItem(icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
      ],
    );
  }

  BottomNavigationBarItem bottomBarItem(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(icon),
      label: label,
    );
  }
}
