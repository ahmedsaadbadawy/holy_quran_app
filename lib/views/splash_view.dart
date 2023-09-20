import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/views/myhome_view.dart';
import '../constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Quran App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Learn Quran and\nRecite onve everyday',
                style: GoogleFonts.poppins(fontSize: 18, color: text),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primary,
                      ),
                      child: SvgPicture.asset('assets/svgs/splash.svg'),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -23,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyHomeView(),
                        ));
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: orange,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            child: Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
