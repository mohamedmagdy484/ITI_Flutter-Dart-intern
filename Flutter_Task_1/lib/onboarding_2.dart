import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        SizedBox(
          height: 520,
          width: double.infinity,
          child: Stack(
            children: [

              Positioned(
                left: -280,
                top: -90,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAEFC9),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // الصورة
              Positioned(
                top: 45,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/two.jpg",
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        Text(
          "Get started with Yoga",
          style: GoogleFonts.pacifico(
            fontSize: 28,
            color: const Color(0xFF9C27B0),
          ),
        ),

        const SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Easily get started with your yoga \njourney",
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