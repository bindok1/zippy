class LyricLine {
  final Duration time;
  final String text;
  final String audioPath;

  LyricLine({required this.time, required this.text, required this.audioPath});

  factory LyricLine.fromMap(Map<String, dynamic> map) {
    return LyricLine(
      time: map['time'] as Duration,
      text: map['text'] as String,
      audioPath: map['audioPath'],
    );
  }
}
