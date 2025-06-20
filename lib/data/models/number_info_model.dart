import 'package:dev_symfony_task/domain/entities/number_info.dart';

class NumberInfoModel extends NumberInfo {
  NumberInfoModel({
    required String text,
    required int number,
    required String type,
    DateTime? savedAt,
  }) : super(
          text: text,
          number: number,
          type: type,
          savedAt: savedAt,
        );

  factory NumberInfoModel.fromJson(Map<String, dynamic> json, String type) {
    return NumberInfoModel(
      text: json['text'] as String,
      number: (json['number'] as num).toInt(),
      type: type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
      'type': type,
      'savedAt': savedAt?.toIso8601String(),
    };
  }

  factory NumberInfoModel.fromLocal(Map<String, dynamic> json) {
    return NumberInfoModel(
      text: json['text'] as String,
      number: json['number'] as int,
      type: json['type'] as String,
      savedAt: json['savedAt'] != null ? DateTime.parse(json['savedAt']) : null,
    );
  }
} 