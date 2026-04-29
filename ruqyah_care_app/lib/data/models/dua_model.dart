// lib/data/models/dua_model.dart

class DuaModel {
  final int id;
  final String titleAr;
  final String titleBn;
  final String textAr;
  final String textBn;
  final String translationEn;
  final String beneifts;
  final String timing;
  final bool isFavorite;

  DuaModel({
    required this.id,
    required this.titleAr,
    required this.titleBn,
    required this.textAr,
    required this.textBn,
    required this.translationEn,
    required this.beneifts,
    required this.timing,
    this.isFavorite = false,
  });

  factory DuaModel.fromJson(Map<String, dynamic> json) {
    return DuaModel(
      id: json['id'] ?? 0,
      titleAr: json['titleAr'] ?? '',
      titleBn: json['titleBn'] ?? '',
      textAr: json['textAr'] ?? '',
      textBn: json['textBn'] ?? '',
      translationEn: json['translationEn'] ?? '',
      beneifts: json['benefits'] ?? '',
      timing: json['timing'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleAr': titleAr,
      'titleBn': titleBn,
      'textAr': textAr,
      'textBn': textBn,
      'translationEn': translationEn,
      'benefits': beneifts,
      'timing': timing,
    };
  }
}
