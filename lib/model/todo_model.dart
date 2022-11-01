class TodoModel {
  int id;
  bool isComplete;
  String title;
  String description;

  get getIsComplete => isComplete;

  set setIsComplete(isComplete) => this.isComplete = isComplete;

  get getTitle => title;

  set setTitle(title) => this.title = title;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  TodoModel(
      {required this.id,
      required this.title,
      required this.description,
      this.isComplete = false});

  factory TodoModel.create(
      {int? id, required String? title, required String? description}) {
    return TodoModel(
        id: id ?? 0, title: title ?? '', description: description ?? '');
  }
}
