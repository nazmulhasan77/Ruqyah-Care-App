// lib/screens/ruqyah_verses/verses_screen.dart
import 'package:flutter/material.dart';

class VersesScreen extends StatelessWidget {
  const VersesScreen({super.key});

  final List<Map<String, String>> categories = const [
    {
      'title': 'বেসিক রুকইয়াহ',
      'subtitle': 'যেকোন সমস্যায় উপকারী আয়াত ও দোয়া',
    },
    {
      'title': 'রুকইয়ার আয়াত',
      'subtitle': 'রুকইয়াহ শারিয়ার প্রসিদ্ধ আয়াতসমূহ',
    },
    {
      'title': 'রুকইয়ার দোয়া',
      'subtitle': 'রুকইয়াহ শারিয়ার উপযোগী কিছু দোয়া',
    },
    {'title': 'বদনজরের আয়াত', 'subtitle': 'বদনজরের রুকইয়ায় উপকারী আয়াত'},
    {'title': 'সিহরের আয়াত', 'subtitle': 'জাদুর জন্য রুকইয়ায় উপকারী আয়াত'},
    {
      'title': 'আয়াতুশ শিফা',
      'subtitle': 'শারীরিক অসুস্থতার চিকিৎসায় উপকারী আয়াত',
    },
    {
      'title': 'আয়াতুল হারক',
      'subtitle': 'জিনের সমস্যা এবং ওয়াসওয়াসায় উপকারী',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F0EB),
        title: const Text('রুকইয়াহ আয়াত'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              title: Text(
                categories[index]['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                categories[index]['subtitle']!,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade400,
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
