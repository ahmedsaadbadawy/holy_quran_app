import 'package:flutter/material.dart';
import '../widgets/custom_list_tile.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return CustomListTile(index: index + 1);
      },
      itemCount: 20,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: const Color(0xFF7B80AD).withOpacity(.3));
      },
    );
  }
}
