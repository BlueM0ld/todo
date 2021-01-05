class TaskStructure {
  final String getTaskTitle;
  final String getTaskLong;
  final String getDate;

  TaskStructure(this.getTaskTitle, this.getTaskLong, this.getDate);

  String get taskTitle => getTaskTitle;
  String get taskLong => getTaskLong;
  String get date => getDate;
}
