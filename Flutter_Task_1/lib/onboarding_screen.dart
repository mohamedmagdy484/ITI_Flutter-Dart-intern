import 'package:flutter/material.dart';
import 'onboarding_1.dart';
import 'onboarding_2.dart';
import 'onboarding_3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const Color mainColor = Color(0xFF9C27B0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F4),   
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: const [
                  Onboarding1(),
                  Onboarding2(),
                  Onboarding3(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: _currentPage == 2
                  ? _buildGetStarted(context)
                  : _buildNavigation(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            _controller.jumpToPage(2);
          },
          child: const Text(
            "Skip",
            style: TextStyle(color: mainColor),
          ),
        ),

        Row(
          children: List.generate(
            3,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.all(4),
              width: _currentPage == index ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? mainColor : Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        TextButton(
          onPressed: () {
            _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: const Text(
            "Next",
            style: TextStyle(color: mainColor),
          ),
        ),
      ],
    );
  }

  Widget _buildGetStarted(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Get Started Clicked")),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Get Started",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
