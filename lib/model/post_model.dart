import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  // factory PostModel.fromJson(Map<String, dynamic> json) {
  //   return PostModel(
  //     userId: json['userId'],
  //     id: json['id'],
  //     title: json['title'],
  //     body: json['body'],
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //       'userId': userId,
  //       'id': id,
  //       'title': title,
  //       'body': body,
  //     };
}
