// lib/screens/videos/videos_screen.dart
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  // YouTube video IDs (ruqyahbd.org থেকে)
  final List<Map<String, String>> videos = [
    {'id': 'VIDEO_ID_1', 'title': 'রুকইয়াহ বিষয়ে লাইভ প্রশ্নোত্তর - পর্ব ৮৭'},
    {
      'id': 'VIDEO_ID_2',
      'title': 'রুকইয়াহ কী, কেন, কিভাবে করে? | চট্টগ্রাম রুকইয়াহ সেমিনার',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ভিডিও')),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'অনুসন্ধান করুন...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (ctx, index) {
                return _buildVideoCard(videos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard(Map<String, String> video) {
    return GestureDetector(
      onTap: () {
        // Open YouTube player
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => YoutubePlayerScreen(videoId: video['id']!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                YoutubePlayer.getThumbnail(videoId: video['id']!),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              video['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class YoutubePlayerScreen extends StatefulWidget {
  final String videoId;
  const YoutubePlayerScreen({super.key, required this.videoId});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ভিডিও')),
      body: YoutubePlayer(controller: _controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
