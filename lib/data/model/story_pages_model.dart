import 'package:zippy/core/base/model/base_model.dart';
import 'package:zippy/data/model/home_pages_model.dart';

class StoryPagesResponse extends BaseModel<StoryPagesResponse> {
  final bool success;
  final int status;
  final String message;
  final List<StoryPage> data;
  final DateTime timestamp;

  StoryPagesResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory StoryPagesResponse.fromJson(Map<String, dynamic> json) {
    return StoryPagesResponse(
      success: json['success'],
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List).map((e) => StoryPage.fromJson(e)).toList(),
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

class StoryPage extends BaseModel<StoryPage> {
  final String id;
  final String homePageId;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String audioUrl;
  final String lyrics;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Story homePage;

  StoryPage({
    required this.id,
    required this.homePageId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.audioUrl,
    required this.lyrics,
    required this.createdAt,
    required this.updatedAt,
    required this.homePage,
  });

  factory StoryPage.fromJson(Map<String, dynamic> json) {
    return StoryPage(
      id: json['id'],
      homePageId: json['home_page_id'],
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['image_url'],
      audioUrl: json['audio_url'],
      lyrics: json['lyrics'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      homePage: Story.fromJson(json['home_page']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'home_page_id': homePageId,
      'title': title,
      'subtitle': subtitle,
      'image_url': imageUrl,
      'audio_url': audioUrl,
      'lyrics': lyrics,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'home_page': homePage.toJson(),
    };
  }

  @override
  String getMessage() => title;
}