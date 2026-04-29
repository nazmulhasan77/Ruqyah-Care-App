// lib/screens/audio/audio_screen.dart
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../core/constants/app_colors.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioPlayer _player = AudioPlayer();
  int _selectedFilter = 0;

  final List<String> filters = ['সব', 'রুকইয়াহ', 'কুরআন', 'ফেভারিট'];

  final List<Map<String, dynamic>> audioList = [
    {
      'title': 'Ruqyah-EvilEye',
      'subtitle': 'বদনজর',
      'type': 'রুকইয়াহ অডিও',
      'url': 'https://example.com/audio1.mp3',
      'isOffline': false,
      'isFav': false,
    },
    {
      'title': 'Ruqyah-EvilEye HQ',
      'subtitle': 'বদনজর',
      'type': 'রুকইয়াহ অডিও',
      'url': 'https://example.com/audio2.mp3',
      'isOffline': false,
      'isFav': false,
    },
    {
      'title': 'Ruqyah-EyeHasad',
      'subtitle': 'বদনজর-হিংসা',
      'type': 'রুকইয়াহ অডিও • অফলাইন',
      'url': 'local_audio.mp3',
      'isOffline': true,
      'isFav': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0EB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F0EB),
        title: const Text('রুকইয়াহ প্লেয়ার'),
        actions: [
          IconButton(
            icon: const Icon(Icons.timer_outlined),
            onPressed: () => _showSleepTimer(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(padding: const EdgeInsets.all(16), child: _buildSearchBar()),

          // Filter Chips
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return _buildFilterChip(index);
              },
            ),
          ),

          const SizedBox(height: 8),

          // Audio List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: audioList.length,
              itemBuilder: (context, index) {
                return _buildAudioItem(audioList[index]);
              },
            ),
          ),

          // Bottom Player Bar
          _buildPlayerBar(),
        ],
      ),
    );
  }

  Widget _buildFilterChip(int index) {
    final isSelected = _selectedFilter == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedFilter = index),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8D5B0) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(Icons.check, size: 14),
              ),
            Text(filters[index]),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioItem(Map<String, dynamic> audio) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD4EDD4)),
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () async {
            await _player.setUrl(audio['url']);
            _player.play();
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFFD4EDD4),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_arrow, color: AppColors.primary),
          ),
        ),
        title: Text(
          audio['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(audio['subtitle']),
            Text(
              audio['type'],
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                audio['isFav'] ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                audio['isOffline'] ? Icons.delete_outline : Icons.download,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Column(
        children: [
          Text(
            'কোনো অডিও চালু নেই',
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 8),

          // Seekbar
          SliderTheme(
            data: SliderThemeData(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              trackHeight: 3,
            ),
            child: Slider(
              value: 0,
              onChanged: (v) {},
              activeColor: AppColors.primary,
            ),
          ),

          // Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('00:00'),
              IconButton(icon: const Icon(Icons.repeat), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () {},
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow),
              ),
              IconButton(icon: const Icon(Icons.skip_next), onPressed: () {}),
              const Text('1.0x'),
              const Text('00:00'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'অডিও খুঁজুন',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  void _showSleepTimer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(title: Text('Sleep Timer')),
          for (var min in [15, 30, 45, 60])
            ListTile(
              title: Text('$min মিনিট'),
              onTap: () => Navigator.pop(ctx),
            ),
        ],
      ),
    );
  }
}
