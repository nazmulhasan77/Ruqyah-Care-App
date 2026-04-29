// lib/data/models/ruqyah_verse_model.dart

class RuqyahVerse {
  final int id;
  final String surahName;
  final String verseNumber;
  final String textAr;
  final String translationBn;
  final String translationEn;
  final String category;
  final String benefits;
  final String audioUrl;
  final bool isFavorite;

  RuqyahVerse({
    required this.id,
    required this.surahName,
    required this.verseNumber,
    required this.textAr,
    required this.translationBn,
    required this.translationEn,
    required this.category,
    required this.benefits,
    required this.audioUrl,
    this.isFavorite = false,
  });

  factory RuqyahVerse.fromJson(Map<String, dynamic> json) {
    return RuqyahVerse(
      id: json['id'] ?? 0,
      surahName: json['surahName'] ?? '',
      verseNumber: json['verseNumber'] ?? '',
      textAr: json['textAr'] ?? '',
      translationBn: json['translationBn'] ?? '',
      translationEn: json['translationEn'] ?? '',
      category: json['category'] ?? '',
      benefits: json['benefits'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'surahName': surahName,
      'verseNumber': verseNumber,
      'textAr': textAr,
      'translationBn': translationBn,
      'translationEn': translationEn,
      'category': category,
      'benefits': benefits,
      'audioUrl': audioUrl,
    };
  }
}
