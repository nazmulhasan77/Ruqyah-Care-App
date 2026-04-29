// lib/data/models/audio_model.dart

class AudioModel {
  final int id;
  final String titleAr;
  final String titleBn;
  final String reciterName;
  final String audioUrl;
  final String thumbnailUrl;
  final int durationInSeconds;
  final String category;
  final bool isFavorite;

  AudioModel({
    required this.id,
    required this.titleAr,
    required this.titleBn,
    required this.reciterName,
    required this.audioUrl,
    required this.thumbnailUrl,
    required this.durationInSeconds,
    required this.category,
    this.isFavorite = false,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      id: json['id'] ?? 0,
      titleAr: json['titleAr'] ?? '',
      titleBn: json['titleBn'] ?? '',
      reciterName: json['reciterName'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      durationInSeconds: json['durationInSeconds'] ?? 0,
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleAr': titleAr,
      'titleBn': titleBn,
      'reciterName': reciterName,
      'audioUrl': audioUrl,
      'thumbnailUrl': thumbnailUrl,
      'durationInSeconds': durationInSeconds,
      'category': category,
    };
  }
}
