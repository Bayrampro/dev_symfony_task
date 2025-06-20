class NumberInfo {
  final String text;
  final int number;
  final String type;
  final DateTime? savedAt;

  NumberInfo({
    required this.text,
    required this.number,
    required this.type,
    this.savedAt,
  });
} 