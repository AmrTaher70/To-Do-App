class ModelTaskManager {
  final String id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final bool isCompleted;
  final int color;
  ModelTaskManager({
    required this.id,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });
  static List<ModelTaskManager> taskList = [
    ModelTaskManager(
      id: '1',
      title: 'Flutter',
      note: 'Learn Dart',
      startTime: '09:00 pm',
      endTime: '10:00 pm',
      isCompleted: false,
      color: 3,
    ),
    ModelTaskManager(
      id: '2',
      title: 'Python',
      note: 'Learn Variable',
      startTime: '10:00 pm',
      endTime: '11:00 pm',
      isCompleted: true,
      color: 4,
    ),
  ];
}
