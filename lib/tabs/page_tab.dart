import 'package:flutter/material.dart';

import '../services/surah_service.dart';
import '../widgets/custom_surah_list_tile.dart';

class PageTab extends StatelessWidget {
  const PageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SurahService().getAllSurahs(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          //print('snapshot = ${snapshot.error}');
          return Container();
        } else {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return CustomSurahListTile(surahModel: snapshot.data[index],tapName: 'PageTap');
            },
            itemCount: snapshot.data.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: const Color(0xFF7B80AD).withOpacity(.3));
            },
          );
        }
      },
    );
  }
}
