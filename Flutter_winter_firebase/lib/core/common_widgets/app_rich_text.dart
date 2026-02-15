import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.originalText,
    required this.highlightedText,
    required this.originalTextStyle,
    required this.highlightedTextStyle,
  });

  final String originalText;
  final String highlightedText;
  final TextStyle originalTextStyle;
  final TextStyle highlightedTextStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: originalText,
        style: originalTextStyle,
        children: [
          TextSpan(text: highlightedText, style: highlightedTextStyle),
        ],
      ),
    );
  }
}
