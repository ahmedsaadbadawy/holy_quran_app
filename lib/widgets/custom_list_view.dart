import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.list});
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: 16),
            Text(
              list[index],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 22,
              ),
              textAlign: TextAlign.right,
            ),
            Divider(color: const Color(0xFF7B80AD).withOpacity(.3)),
          ],
        );
      },
    );
  }
}
