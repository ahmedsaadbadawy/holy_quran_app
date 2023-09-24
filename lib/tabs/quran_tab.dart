import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            customWidths: CustomSliderWidths(
              progressBarWidth: 8,
              trackWidth: 10,
              handlerSize: 5,
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
          ),
          min: 0,
          max: 100,
          initialValue: 14.28 * 3,
        ),
      ),
    );
  }
}
