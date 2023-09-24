import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            customWidths: CustomSliderWidths(
              progressBarWidth: 8,
              trackWidth: 10,
              handlerSize: 6,
            ),
            customColors: CustomSliderColors(
              progressBarColor: primary,
              trackColor: gray,
              shadowMaxOpacity: 0.3,
              dotColor: primary,
            ),
            spinnerMode: false,
            angleRange: 360,
            size: 225,
            infoProperties: InfoProperties(
              mainLabelStyle: TextStyle(color: background),
            ),
          ),
          min: 0,
          max: 6236,
          initialValue: prefs.read(kPrefNumberOfAyat) + 0.0,
        ),
      ),
    );
  }
}
