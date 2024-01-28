import 'package:flutter/material.dart';

import '../constants.dart';
import '../views/pages_detail_view.dart';

class PreviousAndNextSurahNavigation extends StatelessWidget {
  const PreviousAndNextSurahNavigation({
    super.key,
    required this.listofSurah,
    required this.surahNum,
  });

  final dynamic listofSurah;
  final int surahNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (listofSurah[surahNum].number != 1)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.of(context).size.width / 2 - 30,
                35,
              ),
              elevation: 1.5,
              foregroundColor: primary,
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => PageDetailView(
                    surahNum: surahNum - 1,
                    listofSurah: listofSurah,
                  ),
                ),
              );
            },
            child: const Text('previeus'),
          ),
        const Spacer(),
        if (listofSurah[surahNum].number != 114)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                MediaQuery.of(context).size.width / 2 - 30,
                35,
              ),
              elevation: 1.5,
              foregroundColor: primary,
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => PageDetailView(
                    listofSurah: listofSurah,
                    surahNum: surahNum + 1,
                  ),
                ),
              );
            },
            child: const Text('Next'),
          ),
      ],
    );
  }
}
