class TodoModel {
  final String title;
  final String desc;
  final DateTime createdAt;
  const TodoModel(this.title, this.desc, this.createdAt);

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.desc == desc &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => title.hashCode ^ desc.hashCode ^ createdAt.hashCode;
}
