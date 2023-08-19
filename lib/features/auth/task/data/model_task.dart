class ModelTaskManager {
  final String id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final String date;
  final bool isCompleted;
  final int color;
  ModelTaskManager({
    required this.id,
    required this.title,
    required this.note,
    required this.startTime,
    required this.date,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });
}
