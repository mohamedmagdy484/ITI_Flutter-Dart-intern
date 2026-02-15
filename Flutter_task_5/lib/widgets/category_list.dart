import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});
  final List<Map<String, String>> categories = const [
    {'title': 'Beauty', 'image': 'assets/images/beauty.gif'},
    {'title': 'Fashion', 'image': 'assets/images/fashion.gif'},
    {'title': 'Kids', 'image': 'assets/images/kids.jpg'},
    {'title': 'Mens', 'image': 'assets/images/men.jpg'},
    {'title': 'Women', 'image': 'assets/images/women.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(categories[index]['image']!),

                ),
                const SizedBox(height: 8),
                Text(
                  categories[index]['title']!,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}