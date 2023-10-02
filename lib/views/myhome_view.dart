import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/cubits/change_theme_cubit/change_theme_cubit.dart';
import '../tabs/quran_tab.dart';
import '../tabs/page_tab.dart';
import '../tabs/ayat_tab.dart';
import '../widgets/greetings.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: gray,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          if (MediaQuery.of(context).size.width > 365)
            const SizedBox(
              width: 24,
            ),
          Text(
            'Quran App',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width < 365 ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: tm == ThemeMode.dark ? Colors.white : primary,
            ),
          ),
          if (MediaQuery.of(context).size.width > 365) const Spacer(),
          DropdownMenu<String>(
            width: 80,
            menuStyle: const MenuStyle(
              elevation: MaterialStatePropertyAll(0),
            ),
            textStyle: TextStyle(
              color: gray,
            ),
            inputDecorationTheme: InputDecorationTheme(
              fillColor: gray,
              outlineBorder: BorderSide.none,
              //labelStyle: TextStyle(color: gray),
            ),
            trailingIcon: Icon(
              Icons.menu,
              color: tm == ThemeMode.dark ? Colors.white : text,
            ),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'LightMode', label: 'LightMode'),
              DropdownMenuEntry(value: 'DarkMode', label: 'DarkMode'),
            ],
            onSelected: (value) {
              if (value == 'LightMode') {
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
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverToBoxAdapter(
                child: Greetings(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: background,
                automaticallyImplyLeading: false,
                shape: Border(
                    bottom: BorderSide(
                        width: 3,
                        color: const Color(0xFFAAAAAA).withOpacity(.1))),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: customTabBar(context),
                ),
              )
            ],
            body: const TabBarView(
              children: [AyathTab(), PageTab(), QuranTab()],
            ),
          ),
        ),
      ),
    );
  }

  TabBar customTabBar(BuildContext context) {
    return TabBar(
      indicatorColor: primary,
      unselectedLabelColor: text,
      labelColor: tm == ThemeMode.dark ? font : primary,
      indicatorWeight: 3,
      tabs: [
        Tab(
          child: Text(
            'Ayat',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width < 365 ? 12 : 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Page',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width < 365 ? 12 : 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Quran',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width < 365 ? 12 : 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
