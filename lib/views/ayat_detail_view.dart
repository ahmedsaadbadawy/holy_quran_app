import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubits/change_theme_cubit/change_theme_cubit.dart';
import '/constants.dart';
import '/services/ayat_service.dart';

import '../widgets/ayat_item.dart';
import '../widgets/custom_detail_card.dart';

class AyatDetailView extends StatelessWidget {
  const AyatDetailView({
    super.key,
    required this.surahNum,
    required this.listofSurah,
  });
  final int surahNum;
  final dynamic listofSurah;

  @override
  Widget build(BuildContext context) {
    int currentAya = 1;
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          // ignore: deprecated_member_use
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(children: [
            IconButton(
              onPressed: (() {
                prefs.write(kPrefSurahName, listofSurah[surahNum].enName);
                prefs.write(kPrefAyaNumber, currentAya);
                Navigator.of(context).pop();
              }),
              icon: Icon(Icons.arrow_back,
                  size: 20,
                  color: tm == ThemeMode.dark
                      ? Colors.white
                      : const Color.fromARGB(255, 130, 128, 128)),
            ),
            if (MediaQuery.of(context).size.width > 365)
              const SizedBox(
                width: 24,
              ),
            Text(
              listofSurah[surahNum].enName!,
              style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width < 365 ? 14 : 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).highlightColor,
              ),
            ),
            const Spacer(),
            DropdownMenu<String>(
              width: 80,
              // ignore: deprecated_member_use
              textStyle: TextStyle(color: Theme.of(context).backgroundColor),
              inputDecorationTheme:
                  const InputDecorationTheme(outlineBorder: BorderSide.none),
              trailingIcon: Icon(
                Icons.menu,
                color: tm == ThemeMode.dark
                    ? Colors.white
                    : const Color.fromARGB(255, 130, 128, 128),
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
                                  kPrefSurahName, listofSurah[surahNum].enName);
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
              child: CustomDetailCard(surah: listofSurah[surahNum]),
            ),
          ],
          body: FutureBuilder(
              future: AyatService()
                  .getAllAyat(surahNumber: listofSurah[surahNum].number!),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      currentAya = index;
                      return AyatItem(ayat: snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              }),
        ));
  }
}
