import 'package:flutter/material.dart';
import 'package:quran_app/services/surah_service.dart';
import '../widgets/custom_list_tile.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

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
              return CustomListTile(surahModel: snapshot.data[index]);
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
