// lib/screens/duas/duas_screen.dart
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class DuasScreen extends StatelessWidget {
  const DuasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('দোয়া'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                'দোয়া ${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'এখানে দোয়ার বিবরণ আসবে',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              trailing: Icon(Icons.favorite_border, color: AppColors.primary),
            ),
          );
        },
      ),
    );
  }
}
