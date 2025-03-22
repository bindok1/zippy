import 'package:zippy/core/base/model/base_model.dart';

class HomePagesResponse extends BaseModel<HomePagesResponse> {
  final bool success;
  final int status;
  final String message;
  final List<Story> data;
  final DateTime timestamp;

  HomePagesResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory HomePagesResponse.fromJson(Map<String, dynamic> json) {
    return HomePagesResponse(
      success: json['success'],
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List).map((e) => Story.fromJson(e)).toList(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  String getMessage() => message;
}

class Story extends BaseModel<Story> {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  Story({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['image_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'image_url': imageUrl,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  String getMessage() => title;
}