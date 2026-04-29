// lib/core/utils/helpers.dart

class Helpers {
  /// Format duration in seconds to MM:SS format
  static String formatDuration(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  /// Format date to readable format
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  /// Check if string is Arabic
  static bool isArabic(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    return arabicRegex.hasMatch(text);
  }

  /// Get first word from a string
  static String getFirstWord(String text) {
    return text.split(' ').first;
  }
}
