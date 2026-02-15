import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        SizedBox(
          height: 520,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [

              Positioned(
                top: -100,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAEFC9),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/three.jpg",
                  height: 420,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        Text(
          "Unplug your life",
          style: GoogleFonts.pacifico(
            fontSize: 28,
            color: const Color(0xFF9C27B0),
          ),
        ),

        const SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Set up different measures to start \nwith your life",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}