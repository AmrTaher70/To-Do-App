class ModelTaskManager {
  final int? id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final String date;
  final int isCompleted;
  final int color;
  ModelTaskManager({
    this.id,
    required this.title,
    required this.note,
    required this.startTime,
    required this.date,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });
  factory ModelTaskManager.fromJson(Map<String, dynamic> jsonData) {
    return ModelTaskManager(
      id: jsonData['id'],
      date: jsonData['date'],
      title: jsonData['title'],
      note: jsonData['note'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      isCompleted: jsonData['isCompleted'],
      color: jsonData['color'],
    );
  }
}
