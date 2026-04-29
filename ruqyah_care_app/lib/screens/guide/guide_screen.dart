// lib/screens/guide/guide_screen.dart
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('গাইড'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'রুকইয়াহ কীভাবে করবেন',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildGuideStep(
            1,
            'নিয়ত নির্ধারণ করুন',
            'আল্লাহর নামে রুকইয়াহ করার নিয়ত করুন এবং তাওয়াক্কুল করুন।',
          ),
          _buildGuideStep(
            2,
            'শরীর ও পরিবেশ পরিষ্কার করুন',
            'রুকইয়াহ এর আগে ওযু করুন এবং পরিবেশ পরিচ্ছন্ন রাখুন।',
          ),
          _buildGuideStep(
            3,
            'সুরা ফাতিহা পড়ুন',
            'ধীরে ধীরে সুরা ফাতিহা পড়ুন এবং হাত রেখে ফুঁ দিন।',
          ),
          _buildGuideStep(
            4,
            'আয়াতুল কুরসি পড়ুন',
            'আয়াতুল কুরসি পড়ুন এবং নিয়মিত অনুশীলন করুন।',
          ),
          _buildGuideStep(
            5,
            'দোয়া করুন',
            'আল্লাহর কাছে সুস্থতা এবং সুরক্ষার জন্য দোয়া করুন।',
          ),
        ],
      ),
    );
  }

  Widget _buildGuideStep(int stepNum, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$stepNum',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
