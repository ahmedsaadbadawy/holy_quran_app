import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubits/change_theme_cubit/change_theme_cubit.dart';
import '/constants.dart';
import '/services/ayat_service.dart';

import '../models/surah_model.dart';
import '../widgets/ayat_item.dart';
import '../widgets/custom_detail_card.dart';

class AyatDetailView extends StatefulWidget {
  const AyatDetailView({
    super.key,
    required this.surah,
  });
  final SurahModel surah;

  @override
  State<AyatDetailView> createState() => _AyatDetailViewState();
}

class _AyatDetailViewState extends State<AyatDetailView> {
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
                print(
                    'w = ${MediaQuery.of(context).size.width}  h = ${MediaQuery.of(context).size.height}');
                Navigator.of(context).pop();
              }),
              icon: Icon(Icons.arrow_back,
                  size: 20, color: tm == ThemeMode.dark ? Colors.white : text),
            ),
            if (MediaQuery.of(context).size.width > 365)
              const SizedBox(
                width: 24,
              ),
            Text(
              widget.surah.enName!,
              style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width < 365 ? 10 : 20,
                fontWeight: FontWeight.bold,
                color: tm == ThemeMode.dark ? Colors.white : primary,
              ),
            ),
            const Spacer(),
            DropdownMenu<String>(
              width: 80,
              textStyle: TextStyle(color: gray),
              inputDecorationTheme:
                  const InputDecorationTheme(outlineBorder: BorderSide.none),
              trailingIcon: Icon(
                Icons.menu,
                color: tm == ThemeMode.dark ? Colors.white : text,
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
                  BlocProvider.of<ChangeThemeCubit>(context)
                      .changeTheme(ThemeState.light);
                } else if (value == 'DarkMode') {
                  BlocProvider.of<ChangeThemeCubit>(context)
                      .changeTheme(ThemeState.dark);
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
                      return AyatItem(ayat: snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              }),
        ));
  }
}
