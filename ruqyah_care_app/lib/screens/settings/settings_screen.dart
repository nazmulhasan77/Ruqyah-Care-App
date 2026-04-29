// lib/screens/settings/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('সেটিংস'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'প্রদর্শন',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  title: const Text('ডার্ক মোড'),
                  trailing: Switch(
                    value: themeProvider.isDarkMode,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          const Text(
            'অ্যাপ তথ্য',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildSettingItem('সংস্করণ', 'v1.0.0'),
          _buildSettingItem('ডেভেলপার', 'Butterfly Devs'),
          _buildSettingItem('আপডেট চেক করুন', 'সর্বশেষ সংস্করণ ব্যবহার করছেন'),
          const SizedBox(height: 32),
          const Text(
            'আইনি',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildClickableItem('গোপনীয়তা নীতি', () {}),
          _buildClickableItem('শর্তাবলী', () {}),
          _buildClickableItem('আমাদের সম্পর্কে', () {}),
        ],
      ),
    );
  }

  Widget _buildSettingItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(title: Text(title), subtitle: Text(subtitle)),
    );
  }

  Widget _buildClickableItem(String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
