import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/constants.dart';
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
      appBar: customAppBar(),
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
                  child: customTabBar(),
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

  TabBar customTabBar() {
    return TabBar(
      indicatorColor: primary,
      unselectedLabelColor: text,
      indicatorWeight: 3,
      tabs: [
        tabItem(label: 'Ayat'),
        tabItem(label: 'Page'),
        tabItem(label: 'Quran'),
      ],
    );
  }

  Tab tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  AppBar customAppBar() {
    return AppBar(
      backgroundColor: background,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svgs/menu-icon.svg'),
          ),
          const SizedBox(width: 24),
          Text(
            'Quran App',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svgs/search-icon.svg'),
          ),
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}
