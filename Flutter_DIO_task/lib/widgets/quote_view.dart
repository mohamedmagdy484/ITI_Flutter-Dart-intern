import 'package:flutter/material.dart';
import 'package:flutter_winter_dio/model/quotes.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({super.key, required this.quotes});

  final List<Quote> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        title: Text(quotes[index].quote ?? ''),
        subtitle: Text(quotes[index].author ?? ''),
      ),
      separatorBuilder: (context, index) => Divider(),
      itemCount: quotes.length,
    );
  }
}
