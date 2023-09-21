import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/constants.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/greetings.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: customAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: Greetings(),
            )
          ],
          body: const Center(),
        ),
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


