// lib/screens/self_check/self_check_screen.dart
import 'package:flutter/material.dart';

class SelfCheckScreen extends StatelessWidget {
  const SelfCheckScreen({super.key});

  final List<Map<String, String>> checks = const [
    {'title': 'সমস্যা (অনির্দিষ্ট) যাচাই', 'route': '/check/general'},
    {'title': 'বদনজরের সমস্যা যাচাই', 'route': '/check/evil-eye'},
    {'title': 'জিন আক্রান্তের সমস্যা যাচাই', 'route': '/check/jinn'},
    {'title': 'যাদুর সমস্যা যাচাই', 'route': '/check/sihr'},
    {'title': 'ওয়াসওয়াসার সমস্যা যাচাই', 'route': '/check/waswas'},
    {'title': 'বাচ্চাদের সমস্যা যাচাই V1', 'route': '/check/child-v1'},
    {'title': 'বাচ্চাদের সমস্যা যাচাই V2', 'route': '/check/child-v2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('রোগ যাচাই')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...checks.map((check) => _buildCheckItem(context, check)),

          const SizedBox(height: 12),

          _buildSpecialCard(
            title: 'অডিও টেষ্ট',
            description:
                'অডিও শোনার পর শরীরের অস্বাভাবিক প্রতিক্রিয়া, চাপ, অস্থিরতা বা তন্দ্রাচ্ছন্নতা নোট করুন।',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(BuildContext context, Map<String, String> check) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(check['title']!),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildSpecialCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(description, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
