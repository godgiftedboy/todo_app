class TodoModel {
  final String title;
  final String desc;
  TodoModel({required this.title, required this.desc});

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'desc': desc,
    };
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.desc == desc;
  }

  @override
  int get hashCode => title.hashCode ^ desc.hashCode;
}
