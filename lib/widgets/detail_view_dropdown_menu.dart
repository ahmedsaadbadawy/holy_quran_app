import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../cubits/change_theme_cubit/change_theme_cubit.dart';
import '../cubits/last_read_cubit/last_read_cubit.dart';

class DetailViewDropdownMenu extends StatelessWidget {
  const DetailViewDropdownMenu({
    super.key,
    required this.listofSurah,
    required this.surahNum,
  });

  final dynamic listofSurah;
  final int surahNum;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownMenu<String>(
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
                        BlocProvider.of<LastReadCubit>(context)
                            .changeLastRead(
                                ayaNum: int.parse(value),
                                surahName:
                                    listofSurah[surahNum].enName);
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
    );
  }
}
