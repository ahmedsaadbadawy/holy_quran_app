import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/page_item.dart';
import '/constants.dart';
import '/services/ayat_service.dart';

import '../models/surah_model.dart';
import '../widgets/ayat_item.dart';
import '../widgets/custom_detail_card.dart';

class DetailView extends StatefulWidget {
  const DetailView({
    super.key,
    required this.surah,
    required this.tapName,
  });
  final SurahModel surah;
  final String tapName;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: gray,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(children: [
            IconButton(
              onPressed: (() {
                Navigator.of(context).pop();
                setState(() {});
              }),
              icon: const Icon(Icons.arrow_back, size: 30),
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              widget.surah.enName!,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: font,
              ),
            ),
            const Spacer(),
            DropdownMenu<String>(
              textStyle: TextStyle(color: gray),
              inputDecorationTheme:
                  const InputDecorationTheme(outlineBorder: BorderSide.none),
              trailingIcon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 'Book Mark', label: 'Book Mark'),
                DropdownMenuEntry(value: 'LightMode', label: 'LightMode'),
                DropdownMenuEntry(value: 'DarkMode', label: 'DarkMode'),
              ],
              onSelected: (value) {
                if (value == 'Book Mark') {
                  final AlertDialog alert = AlertDialog(
                    title: Text(
                      'Book Mark',
                      style: GoogleFonts.poppins(
                          color: primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    content: SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Divider(color: Colors.black),
                          const SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Number Of Aya',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onSubmitted: (value) async {
                              await prefs.write(
                                  kPrefSurahName, widget.surah.enName);
                              await prefs.write(kPrefAyaNumber, value);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                  showDialog(context: context, builder: (context) => alert);
                } else if (value == 'LightMode') {
                  tm = ThemeMode.system;
                  primary = const Color.fromARGB(255, 3, 72, 32);
                  gray = const Color(0xFF00796A);
                  background = const Color(0xFF00796A);
                  font = Colors.white;
                  text = const Color.fromARGB(255, 3, 74, 32);
                  linearGradiant = [
                    const Color(0xFF00796A),
                    const Color(0xFF009788),
                    const Color(0xFF00796A),
                  ];
                  setState(() {});
                } else if (value == 'DarkMode') {
                  background = const Color(0xFF040C23);
                  text = const Color(0xFFb691ff);
                  orange = const Color(0xFFF9B091);
                  primary = const Color(0xFF6918b4);
                  gray = const Color(0xFF121931);
                  font = Colors.white;
                  linearGradiant = const [
                    Color(0xFFB691FF),
                    Color(0xFF6918B4),
                    Color(0xFF36117E),
                  ];
                  tm = ThemeMode.dark;
                  setState(() {});
                }
              },
            ),
          ]),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: CustomDetailCard(surah: widget.surah),
            ),
          ],
          body: FutureBuilder(
              future:
                  AyatService().getAllAyat(surahNumber: widget.surah.number!),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      if (widget.tapName == kPageTabName) {
                        return PageItem(surah: widget.surah);
                      } else {
                        return AyatItem(ayat: snapshot.data[index]);
                      }
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              }),
        ));
  }
}
