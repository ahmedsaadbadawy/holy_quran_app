import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubits/change_theme_cubit/change_theme_cubit.dart';
import '../services/ayat_service.dart';
import '/constants.dart';
import '../models/surah_model.dart';
import '../widgets/custom_detail_card.dart';

class PageDetailView extends StatelessWidget {
  const PageDetailView({
    super.key,
    required this.surah,
  });
  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    int number = 1;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
            onPressed: (() async {
              await prefs.write(kPrefSurahName, surah.enName);
              await prefs.write(kPrefAyaNumber, number);
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
            surah.enName!,
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
                            await prefs.write(kPrefSurahName, surah.enName);
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
            child: CustomDetailCard(surah: surah),
          ),
        ],
        body: FutureBuilder(
          future: AyatService().getAllAyat(surahNumber: surah.number!),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      SelectableText.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            ...snapshot.data.map(
                              (verse) {
                                return TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${verse.quran}',
                                      style: GoogleFonts.notoNaskhArabic(
                                        color: Theme.of(context).primaryColor,
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    365
                                                ? 18
                                                : 26.5,
                                        height:
                                            MediaQuery.of(context).size.width <
                                                    365
                                                ? 2
                                                : 2.5,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          number = verse.numberinSurah;
                                        },
                                    ),
                                    TextSpan(
                                      text:
                                          ' \uFD3F${verse.numberinSurah}\uFD3E ',
                                      style: GoogleFonts.notoNaskhArabic(
                                        color: Theme.of(context).primaryColor,
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    365
                                                ? 18
                                                : 27,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
