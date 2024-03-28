class PostModelFields {
  static const String id = "id";
  static const String title = "title";
  static const String body = "body";
  static const String userId = "userId";
}

class PostModel {
  final int id;
  final String title;
  final String body;
  final int userId;
  PostModel({required this.id, required this.title, required this.body, required this.userId});
  PostModel copyWith({
    int? id,
    String? title,
    String? body,
    int? userId,
  }) {
    return PostModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      userId: userId ?? this.userId,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json[PostModelFields.id] as int? ?? 0,
      title: json[PostModelFields.title] as String? ?? "",
      body: json[PostModelFields.body] as String? ?? "",
      userId: json[PostModelFields.userId] as int? ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      PostModelFields.id: id,
      PostModelFields.title: title,
      PostModelFields.body: body,
      PostModelFields.userId: userId
    };
  }

  @override
  String toString() {
    return """
    ${PostModelFields.id}:$id,
    ${PostModelFields.title}:$title,
    ${PostModelFields.body}:$body,
    ${PostModelFields.userId}:$userId,
    """;
  }
}
