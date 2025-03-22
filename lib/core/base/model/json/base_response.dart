
class BaseResponse<T> {
  final bool success;
  final int status;
  final String message;
  final T data;
  final DateTime timestamp;

  BaseResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
    required this.timestamp,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return BaseResponse<T>(
      success: json['success'] as bool,
      status: json['status'] as int,
      message: json['message'] as String,
      data: fromJsonT(json['data']),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return {
      'success': success,
      'status': status,
      'message': message,
      'data': toJsonT(data),
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'BaseResponse(success: $success, status: $status, message: $message, data: $data, timestamp: $timestamp)';
  }
}