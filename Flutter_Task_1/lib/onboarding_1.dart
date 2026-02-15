import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
                top: -70,
                right: -225,
                child: Container(
                  width: 480,
                  height: 480,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAEFC9),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/one.jpg",
                  height: 420,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        Text(
          "Practice Mindfulness",
          style: GoogleFonts.pacifico(
            fontSize: 28,
            color: const Color(0xFF9C27B0),
          ),
        ),

        const SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Get on the right track towards \nmindfulness",
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